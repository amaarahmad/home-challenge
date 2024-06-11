import 'package:flutter/material.dart';
import 'package:home_challenge_kanban_task/customWidgets/my-text.dart';
import 'package:home_challenge_kanban_task/provider/custom-theme-provider.dart';
import 'package:home_challenge_kanban_task/utils/colors.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class SetPriorityWidget extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onPressed;
  const SetPriorityWidget({super.key,required this.title,required this.isSelected,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final colorProvider = Provider.of<ThemeProvider>(context);

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
             isSelected? colorProvider.backgroundColor:unSelectedTabColor,
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
          child: MyText(text: title,
            color: whiteColor,
            size: 11.sp,

            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
