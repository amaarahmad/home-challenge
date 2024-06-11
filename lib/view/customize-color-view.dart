import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:home_challenge_kanban_task/extensions/media-query-extensions.dart';
import 'package:home_challenge_kanban_task/extensions/sizebox-extensions.dart';
import 'package:home_challenge_kanban_task/provider/custom-theme-provider.dart';
import 'package:home_challenge_kanban_task/utils/colors.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../customWidgets/my-text.dart';

class CustomizeColorView extends StatelessWidget {
  const CustomizeColorView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorProvider = Provider.of<ThemeProvider>(context);
    final screenHeight=context.screenHeight;
    final screenWidth=context.screenWidth;
    return Scaffold(
      backgroundColor: lightCyan,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          2.height,
          Padding(
            padding:  EdgeInsets.symmetric(horizontal:1.h),
            child: MyText(
              text: "Hello Amaar!",
              size: 15.sp,
              fontWeight: FontWeight.w700,
              color: headingTextColor,
            ).animate().fade(duration: const Duration(seconds: 1)),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal:1.h),
            child: MyText(
              text: "You can select your favourite color",
              size: 11.sp,
              fontWeight: FontWeight.w400,
              color: headingTextColor,
            ).animate().fade(duration: const Duration(milliseconds: 500)).scaleY(),
          ),
          10.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomColor(onPressed: (){
                colorProvider.setBackgroundColor(const Color(0xff1EE776));

              },
                  color: const Color(0xff1EE776)
              ),
              CustomColor(onPressed: (){
                colorProvider.setBackgroundColor(const Color(0xffF3090C));

              },
                  color: const Color(0xffF3090C)
              ),
              CustomColor(onPressed: (){
                colorProvider.setBackgroundColor(const Color(0xffFFC300));

              },
                  color: const Color(0xffFFC300)
              ),
              CustomColor(onPressed: (){
                colorProvider.setBackgroundColor(const Color(0xff6C3483 ));

              },
                  color:const Color(0xff6C3483 )
              ),




            ],
          ),
          5.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              CustomColor(onPressed: (){
                colorProvider.setBackgroundColor(taskBgColor);

              },
                  color:  taskBgColor
              ),
              CustomColor(onPressed: (){
                colorProvider.setBackgroundColor(const Color(0xffCD6155));

              },
                  color: const Color(0xffCD6155)
              ),
              CustomColor(onPressed: (){
                colorProvider.setBackgroundColor(const Color(0xff4DD5B9));
              },
                  color: const  Color(0xff4DD5B9)
              ),
            ],
          ),
          5.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [


              CustomColor(onPressed: (){
                colorProvider.setBackgroundColor(const Color(0xffAEB6BF ));

              },
                  color: const Color(0xffAEB6BF)
              ),
              CustomColor(onPressed: (){
                colorProvider.setBackgroundColor(const Color(0xffD7BDE2));
              },
                  color: const  Color(0xffD7BDE2)
              ),





            ],
          ),
          5.height,

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomColor(onPressed: (){
                colorProvider.setBackgroundColor(const Color(0xff2980B9));
              },
                  color: const  Color(0xff2980B9)
              ),





            ],
          ),

        ],
      ),
    );
  }
}
class CustomColor extends StatelessWidget {
  final VoidCallback onPressed;
  final Color color;
  const CustomColor({super.key, required this.onPressed, required this.color});

  @override
  Widget build(BuildContext context) {
    final colorProvider = Provider.of<ThemeProvider>(context);

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 5.h,
        width: 10.w,
        decoration:  BoxDecoration(
            shape: BoxShape.circle,
            color: color
        ),
      ).animate().
      fadeIn(duration: const Duration(milliseconds: 800))
          .moveY(duration: const Duration(milliseconds: 800)),
    );
  }
}
