import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:home_challenge_kanban_task/customWidgets/my-text.dart';
import 'package:home_challenge_kanban_task/customWidgets/round-button.dart';
import 'package:home_challenge_kanban_task/extensions/media-query-extensions.dart';
import 'package:home_challenge_kanban_task/extensions/sizebox-extensions.dart';
import 'package:home_challenge_kanban_task/models/create-task-model.dart';
import 'package:home_challenge_kanban_task/provider/custom-theme-provider.dart';
import 'package:home_challenge_kanban_task/routes/routes-names.dart';
import 'package:home_challenge_kanban_task/services/task-services.dart';
import 'package:home_challenge_kanban_task/utils/colors.dart';
import 'package:dp_stopwatch/dp_stopwatch.dart';
import 'package:home_challenge_kanban_task/utils/global-functions.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class TaskDetailView extends StatefulWidget {
  const TaskDetailView({super.key});

  @override
  State<TaskDetailView> createState() => _TaskDetailViewState();
}

class _TaskDetailViewState extends State<TaskDetailView> with TickerProviderStateMixin{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

  }
  final stopwatchViewModel = DPStopwatchViewModel(
    clockTextStyle:  TextStyle(
      color: Colors.black,
      fontSize: 15.sp,
    ),
  );
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
          child: StreamBuilder<CreateTaskModel?>(
              stream: TaskServices.fetchSingleTaskStream(taskId),
              builder: (context,AsyncSnapshot<CreateTaskModel?> snapshot){
                if(snapshot.connectionState==ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator(),);
                }
                var taskData=snapshot.data;
            return Column(
              children: [
                Container(
                  height: screenHeight*0.35,
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
                              child: MyText(text: "Task Detail",color: whiteColor,
                                size: 12.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ).animate().fade(duration: const Duration(seconds: 1)),
                            1.height,
                             Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ShowDataWidget(title: "Task Name",
                                    description: taskData!.taskName).animate().fade(duration: const Duration(seconds: 1)),
                                 ShowDataWidget(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    title: "Task Status", description:  taskData.taskStatus).animate().fade(duration: const Duration(seconds: 1)),

                              ],
                            ),

                            2.height,
                             Row(
                               crossAxisAlignment: CrossAxisAlignment.start,

                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ShowDataWidget(title: "Date",
                                    description: changeFormat(taskData.taskDate)).animate().fade(duration: const Duration(seconds: 1)),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    MyText(text: "Comment here",
                                        color: whiteColor,
                                        fontWeight: FontWeight.w600
                                    ).animate().fade(duration: const Duration(seconds: 1)),
                                    IconButton(onPressed: (){
                                      Navigator.pushNamed(context, RoutesNames.commentView,
                                          arguments: taskData.taskId
                                      );
                                    },
                                      icon: const Icon(Icons.message_outlined),
                                      color: whiteColor,
                                    ).animate().fade(duration: const Duration(seconds: 1))
                                  ],
                                )
                              ],
                            ),

                            1.height,

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                taskData.taskStatus=='Completed'?
                                ShowDataWidget(
                                    title: "Completed Date",
                                    description: changeFormat(taskData.taskEndTime)).animate().fade(duration: const Duration(seconds: 1)):SizedBox(),


                              ],
                            ),


                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: screenHeight*0.60,
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
                        2.height,
                        MyText(text: "Description",
                          color: blackColor,
                          size: 12.sp,
                        ).animate().fade(duration: const Duration(seconds: 1)),
                        MyText(
                          text: taskData.taskDescription,
                          color: greyColor,
                          size: 10.sp,
                        ).animate().fade(duration: const Duration(seconds: 1)),

                        1.height,
                        MyText(text: "Priority",
                          color: greyColor,
                          size: 12.sp,
                        ).animate().fade(duration: const Duration(seconds: 1)),
                        1.height,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    colorProvider.backgroundColor,
                                    headingTextColor.withOpacity(0.6)
                                  ],begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter
                                  ),
                                  borderRadius: BorderRadius.circular(30)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 12.0,bottom: 12,
                                    left: 35,
                                    right: 35
                                ),
                                child: MyText(text: taskData.taskPriority,
                                  color: whiteColor,
                                  size: 11.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ).animate().fade(duration: const Duration(seconds: 1)),
                          ],
                        ),
                        5.height,
                         if(DateTime.now().isBefore(taskData.taskDate)&&taskData.taskStatus=='Pending')
                        Column(
                          children: [
                            Center(child: MyText(text: "Time to start",size: 15.sp,fontWeight: FontWeight.w700,)).animate().fade(duration: const Duration(seconds: 1)),
                            Center(child: MyText(text: getDifferenceString(DateTime.now(), taskData.taskDate))).animate().fade(duration: const Duration(seconds: 1)),
                          ],
                        ),
                        if(DateTime.now().isAfter(taskData.taskDate)&&taskData.taskStatus=='Pending')
                          Center(child: MyText(text: "Please Start your task",size: 15.sp,fontWeight: FontWeight.w700,)).animate().fade(duration: const Duration(seconds: 1)),
                        if(taskData.taskStatus=='Completed')
                          Column(
                            children: [
                              Center(child: MyText(text: "Time taken to complete",size: 15.sp,fontWeight: FontWeight.w700,)).animate().fade(duration: const Duration(seconds: 1)),
                              Center(child: MyText(text: calculateTimeDifference(taskData.taskStartTime, taskData.taskEndTime))).animate().fade(duration: const Duration(seconds: 1)),
                            ],
                          ),
                        2.height,
                        if(taskData.taskStatus=='In-progress')
                        Center(
                          child: SizedBox(
                              height: 20.h,
                              child: Lottie.asset(
                                "assets/timming.json",
                                fit: BoxFit.cover,
                                onLoaded: (composition) {},
                              )
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                           if(DateTime.now().isAfter(taskData.taskDate)&&taskData.taskStatus=='Pending')
                              RoundButton(
                                height: 5.h,
                                width: 32.w,
                                title: "Start Task", onTap: (){
                               TaskServices.updateTask(taskId,
                                   {'taskStatus':'In-progress',
                                     'taskStartTime':DateTime.now()},context).then((value){
                               });
                            }).animate().fade(duration: const Duration(seconds: 1)),
                            if(taskData.taskStatus=='In-progress')
                              RoundButton(
                                height: 5.h,
                                width: 32.w,
                                bgColor: greyColor.withOpacity(0.9),
                                title: "End Task", onTap: (){
                                TaskServices.updateTask(
                                    taskId, {'taskStatus':'Completed',
                                  'taskEndTime':DateTime.now()},context);

                              }).animate().fade(duration: const Duration(seconds: 1)),
                          ],
                        ),
                        1.height,

                      ],),
                  ),
                )



              ],
            );
          }),
        ),
      ),
    );
  }
}
class ShowDataWidget extends StatelessWidget {
 final String title;
 final String description;
 final CrossAxisAlignment? crossAxisAlignment;

  const ShowDataWidget({super.key,required this.title,
    required this.description,this.crossAxisAlignment});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment:crossAxisAlignment?? CrossAxisAlignment.start,
      children: [
        MyText(text: title,
            size: 10.5.sp,
            color: whiteColor,
            fontWeight: FontWeight.w600

        ),
        MyText(text: description,
            color: whiteColor,
            size:  11.sp,
            fontWeight: FontWeight.w500
        ),
      ],
    );
  }
}
