import 'package:flutter/material.dart';
import 'package:home_challenge_kanban_task/provider/custom-theme-provider.dart';
import 'package:home_challenge_kanban_task/utils/colors.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

extension SnackbarExtension on BuildContext {
  void showSnackbar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message,style: TextStyle(
          color: whiteColor,
          fontSize: 12.sp
        ),),
      ),
    );
  }
}