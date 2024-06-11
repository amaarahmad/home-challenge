import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:home_challenge_kanban_task/customWidgets/my-text.dart';
import 'package:home_challenge_kanban_task/extensions/sizebox-extensions.dart';
import 'package:home_challenge_kanban_task/extensions/snakbar-extension.dart';
import 'package:home_challenge_kanban_task/models/create-task-model.dart';
import 'package:home_challenge_kanban_task/provider/custom-theme-provider.dart';
import 'package:home_challenge_kanban_task/services/task-services.dart';
import 'package:home_challenge_kanban_task/utils/app-assets.dart';
import 'package:home_challenge_kanban_task/utils/colors.dart';
import 'package:home_challenge_kanban_task/utils/global-functions.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class CommentView extends StatelessWidget {
   CommentView({super.key});
  final commentController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    final colorProvider = Provider.of<ThemeProvider>(context);

    final taskId=ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      backgroundColor: lightCyan,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Center(
              child: MyText(text: "Comments",
                color: colorProvider.backgroundColor,
                size: 13.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: StreamBuilder<CreateTaskModel?>(
                  stream: TaskServices.fetchSingleTaskStream(taskId),
                  builder: (context,AsyncSnapshot<CreateTaskModel?> snapshot){
                    if(snapshot.connectionState==ConnectionState.waiting){
                      return const Center(child: CircularProgressIndicator());
                    }
                    var taskData=snapshot.data;
                return ListView.builder(
                  shrinkWrap: true,
                    itemCount: taskData!.comments.length,
                    physics: const ScrollPhysics(),
                    itemBuilder: (context,index){
                    var commentData=taskData.comments[index];
                  return  Card(
                    color: colorProvider.backgroundColor.withOpacity(0.3),
                    child: ListTile(
                      onLongPress: (){
                        showDialog(context: context, builder: (context){
                          return DeleteDialog(onPressed: (){
                            TaskServices.deleteComment(taskId, commentData).then((value){
                              context.showSnackbar("Comment Deleted");
                              Navigator.pop(context);
                            });

                          },);
                        });
                      },
                        title: MyText(
                          text: "Amaar Ahmad",
                          color: whiteColor,
                          size: 10.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        subtitle: MyText(
                          text: commentData['comment'],
                          color: whiteColor,
                          size: 8.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        trailing: MyText(
                          text: changeFormat(commentData['date']),
                          color: whiteColor,
                        )),
                  ).animate().
                  fadeIn(duration: const Duration(milliseconds: 800))
                      .moveX(duration: const Duration(milliseconds: 800));
                });
              }),
            ),
            TextFormField(
              controller: commentController,
              decoration: InputDecoration(
                hintText: "Write comment here",
                suffixIcon: InkWell(
                  onTap: (){
                    var newComment={
                      'date':DateTime.now(),
                      'comment':commentController.text
                    };
                    TaskServices.updateTask(taskId, {
                      'comments':FieldValue.arrayUnion([newComment])
                    },context).then((value){

                      commentController.clear();
                    });
                  },
                  child: Image.asset(
                    AppAssets.sendIcon,
                    scale: 3,
                    color: colorProvider.backgroundColor,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide:
                   BorderSide(color: colorProvider.backgroundColor, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide:
                   BorderSide(color: colorProvider.backgroundColor, width: 2),
                ),
              ),
            )

          ],
        ),
      )),
    );
  }
}
class DeleteDialog extends StatelessWidget {
  final VoidCallback onPressed;
  const DeleteDialog({super.key,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final colorProvider=Provider.of<ThemeProvider>(context,listen: false);
    return Dialog(
      child: SizedBox(
        height: 15.h,
        child: Padding(padding: EdgeInsets.all(0.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyText(text: "Do you want to delete it?",fontWeight: FontWeight.w600,
            size: 13.sp,
            ),
            2.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: onPressed, child: Text("Yes",style: TextStyle(
                  color:colorProvider.backgroundColor
                ),),),
                TextButton(onPressed: (){
                  Navigator.pop(context);
                }, child: Text("No",style: TextStyle(
                  color: colorProvider.backgroundColor
                ),),),
              ],
            )
          ],
        ),
        ),
      ),
    );
  }
}
