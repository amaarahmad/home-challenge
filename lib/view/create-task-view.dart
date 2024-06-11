import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_challenge_kanban_task/customWidgets/custom-textfield.dart';
import 'package:home_challenge_kanban_task/customWidgets/my-text.dart';
import 'package:home_challenge_kanban_task/customWidgets/round-button.dart';
import 'package:home_challenge_kanban_task/customWidgets/set-priority-widget.dart';
import 'package:home_challenge_kanban_task/customWidgets/task-calender.dart';
import 'package:home_challenge_kanban_task/extensions/media-query-extensions.dart';
import 'package:home_challenge_kanban_task/extensions/sizebox-extensions.dart';
import 'package:home_challenge_kanban_task/extensions/snakbar-extension.dart';
import 'package:home_challenge_kanban_task/models/create-task-model.dart';
import 'package:home_challenge_kanban_task/provider/create-task-provider.dart';
import 'package:home_challenge_kanban_task/provider/custom-theme-provider.dart';
import 'package:home_challenge_kanban_task/provider/set-priority-provider.dart';
import 'package:home_challenge_kanban_task/services/task-services.dart';
import 'package:home_challenge_kanban_task/utils/colors.dart';
import 'package:home_challenge_kanban_task/utils/global-functions.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
class CreateTaskView extends StatefulWidget {
   const CreateTaskView({super.key});

  @override
  State<CreateTaskView> createState() => _CreateTaskViewState();
}

class _CreateTaskViewState extends State<CreateTaskView> {
  final _key=GlobalKey<FormState>();
  @override
  @override
  Widget build(BuildContext context) {
    final arg=ModalRoute.of(context)?.settings.arguments as Map;
    final taskId=arg['taskId'];
    bool isEdit=arg['isEdit'];


    final screenHeight=context.screenHeight;
    final colorProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      backgroundColor:colorProvider.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Consumer<CreateTaskProvider>(builder: (context,provider,child){
            return Form(
              key: _key,
              child:Column(
                children: [
                  Container(
                    height: screenHeight*0.37,
                    width: double.infinity,
                    color: colorProvider.backgroundColor,
                    child: Stack(
                      children: [
                        Container(
                          height: 15.h,
                          width: 40.w,
                          decoration: BoxDecoration(
                              color: headingTextColor.withOpacity(0.1),
                              borderRadius: const BorderRadius.only(
                                  bottomRight: Radius.circular(140)
                              )
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 15.h,
                            width: 40.w,
                            decoration: BoxDecoration(
                                color: headingTextColor.withOpacity(0.1),
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(140)
                                )
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              1.height,
                              Center(
                                child: MyText(text: "Create Task",color: whiteColor,
                                  size: 13.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              1.height,
                              MyText(text: "Task Name",
                                color: whiteColor,
                                size: 11.sp,
                              ),
                               CustomTextFiled(
                                  textEditingController: provider.taskNameController,
                                  hintText: "Enter Task Name Here"),
                              2.height,

                              MyText(text: "Task Date",
                                fontWeight: FontWeight.w600,
                                color: whiteColor,
                                size: 10.sp,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  MyText(text: provider.initialTaskDate,
                                      color: whiteColor,
                                      size:  11.sp,
                                      fontWeight: FontWeight.w500
                                  ),
                                  const TaskCalender()
                                ],
                              ),

                            ],
                          ),
                        )
                      ],
                    ),
                  ),

                  Container(
                    height: screenHeight*0.57,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    decoration:  BoxDecoration(
                        color: whiteColor,
                        borderRadius:BorderRadius.circular(30)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Divider(),
                          2.height,
                          MyText(text: "Description",
                            color: greyColor,
                          ),
                          CustomTextFiled(
                            textEditingController: provider.taskDescriptionController,
                            hintText: "Write description here",
                            hintColor: blackColor.withOpacity(0.6),
                            isMultiLine: true,
                          ),
                          1.height,
                          MyText(text: "Priority",
                            color: greyColor,
                          ),
                          1.height,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SetPriorityWidget(title: "Low", isSelected: provider.defaultPriority=='Low', onPressed: (){
                                provider.changeSelectedTab('Low');
                              }),
                              SetPriorityWidget(title: "Medium", isSelected: provider.defaultPriority=='Medium', onPressed: (){
                                provider.changeSelectedTab('Medium');
                              }),

                              SetPriorityWidget(title: "High", isSelected: provider.defaultPriority=='High', onPressed: (){
                                provider.changeSelectedTab('High');
                              }),
                            ],
                          ),
                          2.height,
                          isEdit?
                          RoundButton(
                              height: 6.h,
                              title: "Update Task", onTap: (){
                            if(_key.currentState!.validate()){

                              TaskServices.updateTask(taskId,{
                                'taskId': taskId,
                                'taskName': provider.taskNameController.text,
                                'taskDate': provider.initialDate,
                                'taskDescription': provider.taskDescriptionController.text,
                                'taskPriority': provider.defaultPriority,
                                'taskStatus': 'Pending',

                              },context).then((value) {
                                Navigator.pop(context);
                              });
                              customPrint("validate");
                            }
                          }) :
                          RoundButton(
                              height: 6.h,
                              title: "Create Task", onTap: (){
                                if(_key.currentState!.validate()){
                                  if(provider.initialTaskDate=='Select Date'){
                                    context.showSnackbar("Please Select date");
                                  }else{
                                    var taskData=CreateTaskModel
                                      (
                                        taskId: '',
                                        taskName: provider.taskNameController.text,
                                        taskDate: provider.initialDate,
                                        taskDescription: provider.taskDescriptionController.text,
                                        taskPriority: provider.defaultPriority,
                                        taskStatus: 'Pending',
                                        comments: [],
                                        taskStartTime:DateTime.now() ,
                                        taskEndTime: DateTime.now()

                                    );
                                    TaskServices.addTask(taskData,context);
                                  }

                                }
                          })
                        ],),
                    ),
                  )



                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}

