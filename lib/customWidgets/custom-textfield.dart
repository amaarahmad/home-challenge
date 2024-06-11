import 'package:flutter/material.dart';
import 'package:home_challenge_kanban_task/utils/colors.dart';
import 'package:sizer/sizer.dart';

class CustomTextFiled extends StatelessWidget {
  final String hintText;
  final double? hintSize;
  final Color? hintColor;
  final bool? isMultiLine;
  final TextEditingController? textEditingController;
  const CustomTextFiled({super.key,
    required this.hintText,
    this.hintSize,
    this.hintColor,
    this.isMultiLine=false,
    this.textEditingController

  });

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      controller: textEditingController,
      validator: (value){
        if(value!.isEmpty){
          return 'Field Required';
        }
      },
      style:  TextStyle(

          color:hintColor?? whiteColor,
          fontSize:hintSize?? 13.sp,
          fontWeight: FontWeight.w600
      ),
      maxLines:isMultiLine==true?7: 1,
      decoration:  InputDecoration(
        hintText: hintText,
        hintStyle:  TextStyle(
            color:hintColor?? whiteColor,
            fontSize:hintSize?? 13.sp,
            fontWeight: FontWeight.w600
        ),

      ),
    );
  }
}
