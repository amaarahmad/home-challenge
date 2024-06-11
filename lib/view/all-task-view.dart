import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:home_challenge_kanban_task/customWidgets/my-text.dart';
import 'package:home_challenge_kanban_task/extensions/sizebox-extensions.dart';
import 'package:home_challenge_kanban_task/models/create-task-model.dart';
import 'package:home_challenge_kanban_task/provider/custom-theme-provider.dart';
import 'package:home_challenge_kanban_task/provider/tab-bar-provider.dart';
import 'package:home_challenge_kanban_task/routes/routes-names.dart';
import 'package:home_challenge_kanban_task/services/task-services.dart';
import 'package:home_challenge_kanban_task/utils/app-assets.dart';
import 'package:home_challenge_kanban_task/utils/colors.dart';
import 'package:home_challenge_kanban_task/utils/global-functions.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class AllTaskView extends StatefulWidget {
   const AllTaskView({super.key});

  @override
  State<AllTaskView> createState() => _AllTaskViewState();
}

class _AllTaskViewState extends State<AllTaskView> {

  @override
  Widget build(BuildContext context) {
    final colorProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      backgroundColor: lightCyan,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              2.height,
              MyText(
                text: "Hello Amaar!",
                size: 15.sp,
                fontWeight: FontWeight.w700,
                color: headingTextColor,
              ).animate().fade(duration: const Duration(seconds: 1)),
              MyText(
                text: "Here are your all task.",
                size: 11.sp,
                fontWeight: FontWeight.w400,
                color: headingTextColor,
              ).animate().fade(duration: const Duration(milliseconds: 500)).scaleY(),
              2.height,
             Consumer<TabBarProvider>
               (builder: (context,provider,child){
               return  Align(
                 alignment: Alignment.centerRight,
                 child: DropdownButtonHideUnderline(
                   child: DropdownButton2<String>(
                     isExpanded: true,
                     style: const TextStyle(
                         color: whiteColor
                     ),
                     hint: Text(
                       'Sort by',
                       style: TextStyle(
                         fontSize: 12.sp,
                         color: whiteColor,
                       ),
                     ),
                     items:
                     provider.items.map((String item) => DropdownMenuItem<String>(
                       value: item,
                       child: Text(
                         item,
                         style:  TextStyle(
                           fontSize: 12.sp,
                         ),
                       ),
                     ))
                         .toList(),
                     value: provider.selectedDropdown,
                     onChanged: (String? value) {
                       provider.changeDropdown(value!);
                       customPrint(value);

                     },
                     dropdownStyleData:  DropdownStyleData(
                         decoration: BoxDecoration(
                             color: colorProvider.backgroundColor
                         )
                     ),
                     buttonStyleData:  ButtonStyleData(
                       decoration: BoxDecoration(
                           color: colorProvider.backgroundColor.withOpacity(0.5),
                           borderRadius: BorderRadius.circular(10)
                       ),
                       padding: const EdgeInsets.symmetric(horizontal: 16),
                       height: 5.h,
                       width: 40.w,
                     ),
                     menuItemStyleData:  MenuItemStyleData(

                         height: 4.h,
                         overlayColor: const MaterialStatePropertyAll(Colors.black)
                     ),
                   ),
                 ),
               );
             }),
              1.height,
             Consumer<TabBarProvider>(builder: (context,provider,child){
               return  StreamBuilder<List<CreateTaskModel>>
                 (stream: TaskServices.fetchAllTaskStreamForAllView(context),
                   builder: (context,AsyncSnapshot<List<CreateTaskModel>> snapshot){
                     if (snapshot.hasError) {
                       return Text('Error: ${snapshot.error}');
                     }if(snapshot.connectionState==ConnectionState.waiting){
                       return const Center(child: CircularProgressIndicator());
                     }
                     if(!snapshot.hasData||snapshot.data!.isEmpty){
                       return SizedBox(
                         height: 60.h,
                         child: Center(
                           child: MyText(text: "Not Found"),
                         ),
                       );
                     }
                     var data=snapshot.data;
                     return Expanded(
                       child: ListView.builder(
                           itemCount:data!.length,
                           itemBuilder: (context,index){
                             var taskData=data[index];
                             return  Card(
                               color: colorProvider.backgroundColor.withOpacity(0.3),
                               child: ListTile(
                                 leading: Container(
                                   width: 11.w,
                                   decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(10),
                                     gradient: LinearGradient(colors: [
                                       colorProvider.backgroundColor.withOpacity(0.3),
                                       headingTextColor.withOpacity(0.6)
                                     ],begin: Alignment.topCenter,
                                         end: Alignment.bottomCenter
                                     ),

                                   ),
                                   child: Image.asset(AppAssets.taskIcon,
                                     color: whiteColor,
                                     scale: 3,
                                   ),
                                 ),
                                 title: MyText(text: taskData.taskName,size: 12.sp,
                                   fontWeight: FontWeight.w600,
                                   color: whiteColor,
                                 ),
                                 subtitle: MyText(text: taskData.taskStatus,size: 10.sp,color: whiteColor,),
                                 trailing: ElevatedButton(
                                     style: ButtonStyle(
                                         backgroundColor:
                                         MaterialStatePropertyAll(
                                             colorProvider.backgroundColor.withOpacity(0.3))
                                     ),
                                     onPressed: (){
                                       Navigator.pushNamed
                                         (context, RoutesNames.taskDetailView,
                                           arguments:
                                           {'taskId':taskData.taskId,
                                             'isEdit':false
                                           });
                                     }, child: MyText(text: "View",
                                   size: 10.sp,
                                   color: whiteColor,
                                 )),
                               ),
                             ).animate().
                             fadeIn(duration: const Duration(milliseconds: 800))
                                 .moveX(duration: const Duration(milliseconds: 800));
                           }),
                     );
                   });
             })

            ],
          ),
        ),
      ),
    );
  }
}
