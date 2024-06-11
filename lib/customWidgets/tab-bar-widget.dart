import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:home_challenge_kanban_task/customWidgets/my-text.dart';
import 'package:home_challenge_kanban_task/utils/colors.dart';
import 'package:sizer/sizer.dart';

class TabBarWidget extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onPressed;
  const TabBarWidget({super.key,required this.title,required this.isSelected,required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            color:isSelected? whiteColor:unSelectedTabColor,
            borderRadius: BorderRadius.circular(30)),
        child: Padding(
          padding: const EdgeInsets.only(
              left: 15.0, right: 15, top: 10, bottom: 10),
          child: MyText(
            text: title,
            size: 10.sp,
            color: blackColor,
            fontWeight:isSelected? FontWeight.w600:FontWeight.w500,
          ),
        ),
      ),
    ).animate().fadeIn(duration: const Duration(milliseconds: 600));
  }
}
