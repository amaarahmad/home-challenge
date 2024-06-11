import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:home_challenge_kanban_task/models/create-task-model.dart';
import 'package:home_challenge_kanban_task/provider/create-task-provider.dart';
import 'package:home_challenge_kanban_task/provider/loading-provider.dart';
import 'package:home_challenge_kanban_task/provider/tab-bar-provider.dart';
import 'package:home_challenge_kanban_task/utils/global-functions.dart';
import 'package:provider/provider.dart';

class TaskServices{
 static final  _taskCollection=FirebaseFirestore.instance.collection('task');

  static Future<void>addTask(CreateTaskModel createTaskModel,BuildContext context)async{
    final loadingProvider=Provider.of<LoadingProvider>(context,listen: false);
    final createTaskProvider=Provider.of<CreateTaskProvider>(context,listen: false);
    try{
      loadingProvider.setLoading(true);
       await _taskCollection.doc().set(createTaskModel.toMap()).then((value){
         customPrint("Task Added Successfully");
         loadingProvider.setLoading(false);
         createTaskProvider.clearResources();
         if(context.mounted){
           Navigator.pop(context);
         }
       }).onError((error, stackTrace){
         loadingProvider.setLoading(false);
         customPrint(error.toString());
       });
    }catch(e){
      loadingProvider.setLoading(false);
      customPrint(e.toString());
    }
  }
  static Future<void>deleteTask(String taskId)async{
    try{
      await _taskCollection.doc(taskId).delete().then((value){
        customPrint("Task Deleted Successfully");

      }).onError((error, stackTrace){
        customPrint(error.toString());
      });
    }catch(e){
      customPrint(e.toString());

    }
  }

 static Future<void> updateTask(String taskId,Map<String,dynamic>map,BuildContext context)async{
   final loadingProvider=Provider.of<LoadingProvider>(context,listen: false);
   final createTaskProvider=Provider.of<CreateTaskProvider>(context,listen: false);
   try{
     loadingProvider.setLoading(true);
     _taskCollection.doc(taskId).update(map).then((value){
       loadingProvider.setLoading(false);
       createTaskProvider.clearResources();

       customPrint('Task updated');
     });
   }catch(e){
     loadingProvider.setLoading(false);

     customPrint(e.toString());
   }
 }
  static Stream<CreateTaskModel?>fetchSingleTaskStream(String taskId){
    return _taskCollection.doc(taskId).snapshots().map((data) {
      if(data.exists){
        return CreateTaskModel.fromDoc(data);
      }else{
        return null;
      }
    });
  }
  static Future<CreateTaskModel?>fetchSingleTaskFuture(String taskId)async{
    DocumentSnapshot data=await _taskCollection.doc(taskId).get();
    if(data.exists){
      return CreateTaskModel.fromDoc(data);
    }else{
      return null;
    }
  }
 static Future<void> deleteComment(String taskId, Map<String, dynamic> comment) async {
   try {
     await _taskCollection.doc(taskId).update({
       'comments': FieldValue.arrayRemove([comment])
     });
     customPrint('Comment deleted');
   } catch (e) {
     customPrint(e.toString());
   }
 }
 static Stream<List<CreateTaskModel>> fetchAllTaskStream(BuildContext context) {
    final tabBarProvider=Provider.of<TabBarProvider>(context,listen: false);
    String? query='';
    if(tabBarProvider.selectedTab=='my-task'){
      return _taskCollection.snapshots().map((snapshot) {
        return snapshot.docs.map((doc) {
          if (doc.exists) {
            return CreateTaskModel.fromDoc(doc);
          }
          return null;
        }).where((task) => task != null).cast<CreateTaskModel>().toList();
      });

    }else{
      query=tabBarProvider.selectedTab;
      customPrint(tabBarProvider.selectedTab);
      return _taskCollection.where('taskStatus',isEqualTo: query).snapshots().map((snapshot) {
        return snapshot.docs.map((doc) {
          if (doc.exists) {
            return CreateTaskModel.fromDoc(doc);
          }
          return null;
        }).where((task) => task != null).cast<CreateTaskModel>().toList();
      });

    }
 }
 static Stream<List<CreateTaskModel>> fetchAllTaskStreamForAllView(BuildContext context) {
   final tabBarProvider=Provider.of<TabBarProvider>(context,listen: false);
   String? query='';
   if(tabBarProvider.selectedDropdown=='My Task'){
     return _taskCollection.snapshots().map((snapshot) {
       return snapshot.docs.map((doc) {
         if (doc.exists) {
           return CreateTaskModel.fromDoc(doc);
         }
         return null;
       }).where((task) => task != null).cast<CreateTaskModel>().toList();
     });

   }else{
     query=tabBarProvider.selectedDropdown;
     return _taskCollection.where('taskStatus',isEqualTo: query).snapshots().map((snapshot) {
       return snapshot.docs.map((doc) {
         if (doc.exists) {
           return CreateTaskModel.fromDoc(doc);
         }
         return null;
       }).where((task) => task != null).cast<CreateTaskModel>().toList();
     });

   }
 }

 static Future<List<CreateTaskModel>> fetchAllTaskFuture() async {
   try {
     QuerySnapshot snapshot = await _taskCollection.get();
     return snapshot.docs.map((doc) {
       if (doc.exists) {
         return CreateTaskModel.fromDoc(doc);
       }
       return null;
     }).where((task) => task != null).cast<CreateTaskModel>().toList();
   } catch (e) {
     customPrint("Error fetching task: $e");
     return [];
   }
 }

}