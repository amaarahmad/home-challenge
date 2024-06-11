import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:home_challenge_kanban_task/customWidgets/my-text.dart';
import 'package:home_challenge_kanban_task/customWidgets/pop-over-widget.dart';
import 'package:home_challenge_kanban_task/customWidgets/shimmer-widget.dart';
import 'package:home_challenge_kanban_task/customWidgets/size-file.dart';
import 'package:home_challenge_kanban_task/customWidgets/tab-bar-widget.dart';
import 'package:home_challenge_kanban_task/extensions/sizebox-extensions.dart';
import 'package:home_challenge_kanban_task/models/create-task-model.dart';
import 'package:home_challenge_kanban_task/provider/create-task-provider.dart';
import 'package:home_challenge_kanban_task/provider/custom-theme-provider.dart';
import 'package:home_challenge_kanban_task/provider/tab-bar-provider.dart';
import 'package:home_challenge_kanban_task/routes/routes-names.dart';
import 'package:home_challenge_kanban_task/services/task-services.dart';
import 'package:home_challenge_kanban_task/utils/app-assets.dart';
import 'package:home_challenge_kanban_task/utils/colors.dart';
import 'package:home_challenge_kanban_task/utils/global-functions.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorProvider = Provider.of<ThemeProvider>(context);
    final createTaskProvider = Provider.of<CreateTaskProvider>(context,listen: false);
    return Scaffold(
      backgroundColor: lightCyan,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                2.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.menu),
                    Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: headingTextColor),
                      child: const Padding(
                        padding: EdgeInsets.all(5),
                        child: Icon(
                          Icons.person,
                          color: whiteColor,
                        ),
                      ),
                    )
                  ],
                ),
                MyText(
                  text: "Hello Amaar!",
                  size: 15.sp,
                  fontWeight: FontWeight.w700,
                  color: headingTextColor,
                ).animate().fade(duration: const Duration(seconds: 1)),
                MyText(
                  text: "Have a nice day.",
                  size: 11.sp,
                  fontWeight: FontWeight.w400,
                  color: headingTextColor,
                ).animate().fade(duration: const Duration(milliseconds: 500)).scaleY(),
                2.height,
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Consumer<TabBarProvider>(builder: (context,provider,child){
                        return TabBarWidget(title: "My Task",
                            isSelected: provider.selectedTab=='my-task', onPressed: (){
                          provider.changeSelectedTab('my-task');
                            });
                      }),
                      1.width,
                      Consumer<TabBarProvider>(builder: (context,provider,child){
                        return TabBarWidget(title: "In Progress",
                            isSelected: provider.selectedTab=='In-progress', onPressed: (){
                              provider.changeSelectedTab('In-progress');
                            });
                      }),
                      1.width,
                      Consumer<TabBarProvider>(builder: (context,provider,child){
                        return TabBarWidget(title: "Completed",
                            isSelected: provider.selectedTab=='Completed', onPressed: (){
                              provider.changeSelectedTab('Completed');
                            });
                      }),
                      1.width,
                      Consumer<TabBarProvider>(builder: (context,provider,child){
                        return TabBarWidget(title: "Pending",
                            isSelected: provider.selectedTab=='Pending', onPressed: (){
                              provider.changeSelectedTab('Pending');
                            });
                      }),

                    ],
                  ),
                ),
                1.height,

                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, RoutesNames.allTaskView);
                  },
                  child: Align(
                    alignment: Alignment.topRight,
                    child: MyText(
                      text: "See all",
                      size: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                1.height,
                Consumer<TabBarProvider>(builder: (context,provider,child){
                  return StreamBuilder<List<CreateTaskModel?>>(
                      stream: TaskServices.fetchAllTaskStream(context),
                      builder: (context,AsyncSnapshot<List<CreateTaskModel?>> snapshot){
                        if(snapshot.connectionState==ConnectionState.waiting){
                          return  CustomShimmerEffect.shimmerForRectangularPic();
                        }
                        if(snapshot.hasError){
                          customPrint(snapshot.error.toString());
                          return Center(child: Text(snapshot.error.toString()),);
                        }if(!snapshot.hasData||snapshot.data!.isEmpty){
                          return SizedBox(
                            height: 20.h,
                            child: Center(
                              child: MyText(text: "Not Found"),
                            ),
                          );
                        }
                        var data=snapshot.data;
                        return SizedBox(
                          height: 20.h,
                          child: ListView.builder(
                              itemCount: data!.length,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (context,index){
                                var taskData=data[index];
                                return Row(
                                  children: [
                                    InkWell(
                                      onTap: (){
                                        Navigator.pushNamed
                                          (context, RoutesNames.taskDetailView,
                                            arguments:
                                            {'taskId':taskData.taskId,
                                              'isEdit':false
                                            });

                                      },
                                      child: Container(
                                        width: 40.w,
                                        height: 20.h,
                                        decoration: BoxDecoration(
                                            color:  colorProvider.backgroundColor.withOpacity(0.5),
                                            borderRadius: BorderRadius.circular(10)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        gradient: LinearGradient(colors: [
                                                          colorProvider.backgroundColor,
                                                          headingTextColor.withOpacity(0.6)
                                                        ],begin: Alignment.topCenter,
                                                            end: Alignment.bottomCenter
                                                        ),
                                                        borderRadius: BorderRadius.circular(10)),
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(4.0),
                                                      child: Image.asset(
                                                        AppAssets.taskIcon,
                                                        color: whiteColor,
                                                        scale: 3.5,
                                                      ),
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  TaskPopOver(deleteFunction: (){
                                                    TaskServices.deleteTask(taskData!.taskId);
                                                    Navigator.pop(context);
                                                  }, editFunction: (){
                                                    createTaskProvider.taskNameController.text=taskData!.taskName;
                                                    createTaskProvider.taskDescriptionController.text=taskData.taskDescription;
                                                    createTaskProvider.initialTaskDate=changeFormat(taskData.taskDate);
                                                    createTaskProvider.defaultPriority=taskData.taskPriority;
                                                    Navigator.pushNamed
                                                      (context, RoutesNames.createTaskView,
                                                        arguments:
                                                        {'taskId':taskData!.taskId,
                                                          'isEdit':true
                                                        }).then((value){
                                                      Navigator.pop(context);
                                                    });
                                                   // Navigator.pop(context);

                                                  }),

                                                ],
                                              ),
                                              3.height,
                                              SizedBox(
                                                width: 35.w,
                                                child: MyText(
                                                  text: taskData!.taskName,
                                                  color: whiteColor,
                                                  size: 12.sp,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              const Spacer(),
                                              MyText(
                                                text: changeFormat(taskData.taskDate),
                                                color: whiteColor,
                                                size: 8.sp,
                                                fontWeight: FontWeight.w500,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ).animate().
                                    fadeIn(duration: const Duration(milliseconds: 800))
                                        .moveX(duration: const Duration(milliseconds: 800)),
                                    2.width,

                                  ],
                                );
                              }),
                        );
                      });
                }),

              1.height,
                MyText(
                  text: "Stats",
                  size: 12.sp,
                  fontWeight: FontWeight.w700,
                  color: headingTextColor,
                ),
              1.height,
              StreamBuilder<List<CreateTaskModel>>
                (stream: TaskServices.fetchAllTaskStream(context),
                  builder: (context,AsyncSnapshot<List<CreateTaskModel>> snapshot){
                    if(snapshot.connectionState==ConnectionState.waiting){
                      return  CustomShimmerEffect.shimmerForRectangularPic();

                    }
                  int totalTask=0;
                  int completedTask=0;
                  int pendingTask=0;
                  int inProgressTask=0;

                  for(var doc in snapshot.data!){
                    totalTask++;
                    if(doc.taskStatus=='Pending'){
                      pendingTask++;
                    }else if(doc.taskStatus=='In-progress'){
                      inProgressTask++;
                    }else{
                      completedTask++;
                    }
                  }
                return  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                         ProgressWidget(
                            imgUrl: AppAssets.completedIcon,
                            title: "Completed",
                            number: completedTask.toString()),
                        2.height,
                         ProgressWidget(
                          imgUrl: AppAssets.progressIcon,
                          title: "In-progress",
                          number: inProgressTask.toString(),
                          topPadding: 10,
                          bottomPadding: 10,

                        ),
                      ],
                    ),
                    Column(
                      children: [
                         ProgressWidget(
                          imgUrl: AppAssets.pendingIcon,
                          title: "Pending",
                          number: pendingTask.toString(),
                          topPadding: 10,
                          bottomPadding: 10,

                        ),
                        2.height,

                         ProgressWidget(
                            imgUrl: AppAssets.completedIcon,
                            title: "Total",
                            number: totalTask.toString()),

                      ],
                    ),
                  ],
                );
              })

              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProgressWidget extends StatelessWidget {
  final String imgUrl;
  final String number;
  final String title;
  final double? topPadding;
  final double? bottomPadding;

  const ProgressWidget(
      {super.key,
      required this.imgUrl,
      required this.title,
      required this.number,
      this.topPadding,
      this.bottomPadding});
  @override
  Widget build(BuildContext context) {
    final colorProvider = Provider.of<ThemeProvider>(context);

    return Container(
      width: 45.w,
      decoration: BoxDecoration(
          color: colorProvider.backgroundColor.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.only(
          top: topPadding ?? 10.0,
          bottom: bottomPadding ?? 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration:  BoxDecoration(
                gradient: LinearGradient(colors: [
                  colorProvider.backgroundColor,
                  headingTextColor.withOpacity(0.6)
                ],begin: Alignment.topCenter,
                    end: Alignment.bottomCenter
                ),
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child: Image.asset(
                    imgUrl,
                    color: whiteColor,
                    scale: 3,
                  ),
                ),
              ),
            ),
            2.height,
            MyText(
              text: number,
              color: whiteColor,
              size: 12.sp,
              fontWeight: FontWeight.w800,
            ),
            1.height,
            MyText(
              text: title,
              color: whiteColor,
              size: 11.sp,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    ).animate().
    fadeIn(duration: const Duration(milliseconds: 800))
        .moveX(duration: const Duration(milliseconds: 800));
  }
}
