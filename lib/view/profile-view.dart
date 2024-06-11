import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:home_challenge_kanban_task/customWidgets/my-text.dart';
import 'package:home_challenge_kanban_task/customWidgets/profile-widget.dart';
import 'package:home_challenge_kanban_task/extensions/media-query-extensions.dart';
import 'package:home_challenge_kanban_task/extensions/sizebox-extensions.dart';
import 'package:home_challenge_kanban_task/provider/create-task-provider.dart';
import 'package:home_challenge_kanban_task/provider/custom-theme-provider.dart';
import 'package:home_challenge_kanban_task/routes/routes-names.dart';
import 'package:home_challenge_kanban_task/utils/app-assets.dart';
import 'package:home_challenge_kanban_task/utils/colors.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:table_calendar/table_calendar.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {

  @override
  Widget build(BuildContext context) {
    final screenHeight=context.screenHeight;
    final screenWidth=context.screenWidth;
    final colorProvider = Provider.of<ThemeProvider>(context);
    final createTaskProvider = Provider.of<CreateTaskProvider>(context,listen: false);

    return   Scaffold(
      backgroundColor: lightCyan,
      body: SafeArea(
          child: Column(
            children: [
              Stack(
                      children: [
              Container(
                height: screenHeight*0.25,
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

                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.h,left: 2.5.w),
                child: SizedBox(
                  height: screenHeight *0.25,
                  width: screenWidth*0.95,
                  child: Card(
                    color: whiteColor,
                    child: Column(
                      children: [
                        7.height,
                        MyText(text: "Amaar Ahmad",
                          fontWeight: FontWeight.w600,
                          size: 14.sp,
                          color: headingTextColor,
                        ).animate().
                        fadeIn(duration: const Duration(milliseconds: 800))
                            .moveX(duration: const Duration(milliseconds: 800)),
                        MyText(text: "Full Stack Developer",
                          fontWeight: FontWeight.w500,
                          size: 10.sp,
                          color: headingTextColor,
                        ).animate().
                        fadeIn(duration: const Duration(milliseconds: 800))
                            .moveX(duration: const Duration(milliseconds: 800)),
                        2.height,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(AppAssets.mapIcon,color: colorProvider.backgroundColor,),
                            1.width,
                            MyText(text: "Islamabad, Pakistan",
                            size: 8.sp,
                              color: headingTextColor,
                            ).animate().
                            fadeIn(duration: const Duration(milliseconds: 800))
                                .moveX(duration: const Duration(milliseconds: 800)),

                          ],
                        )
                        //Image.asset(AppAssets.myImage,height: 10.h,)
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 11.h,
                child: Container(
                  height: 10.h,
                  width: 30.w,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(image: AssetImage(AppAssets.myImage),
                          fit: BoxFit.contain
                      )
                  ),
                ),
              ).animate().
              fadeIn(duration: const Duration(milliseconds: 800))
                  .moveY(duration: const Duration(milliseconds: 800)),
                      ],
                    ),
              5.height,
               Column(
                children: [
                  ProfileWidget(title: "Crete Task",iconUrl: AppAssets.taskProfileIconLarge,
                  onPressed: (){
                    createTaskProvider.taskNameController.text='';
                    createTaskProvider.taskDescriptionController.text='';
                    createTaskProvider.initialTaskDate='Select Date';
                    createTaskProvider.defaultPriority='Low';
                    Navigator.pushNamed
                      (context, RoutesNames.createTaskView,
                        arguments:
                        {'taskId':'',
                          'isEdit':false
                        });
                    },
                  ),
                  const ProfileWidget(title: "Statistics",iconUrl: AppAssets.statisticsIcon,),
                   ProfileWidget(title: "Customize",iconUrl: AppAssets.statisticsIcon,
                  onPressed: (){
                    Navigator.pushNamed(context, RoutesNames.customizeColorView);
                  },
                  ),
                  const ProfileWidget(title: "Location",iconUrl: AppAssets.locationIcon,),
                  const ProfileWidget(title: "Settings",iconUrl: AppAssets.settingIcon,),
                  const ProfileWidget(title: "Logout",iconUrl: AppAssets.logOutIcon,),
                ],
              )
            ],
          )),
    );

  }
}
