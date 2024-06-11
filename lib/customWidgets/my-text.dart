// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  String text;
  TextAlign? textAlignment;
  double? size;
  dynamic textDecoration;
  FontWeight? fontWeight;
  Color? color;
  int? maxLine;
  String? fontFamily;


  MyText({super.key,required this.text, this.textAlignment, this.size, this.textDecoration,
    this.fontWeight, this.color, this.maxLine,this.fontFamily});

  @override
  Widget build(BuildContext context) {
    return Text(
      overflow:TextOverflow.ellipsis,
      maxLines: 2,
      text,style: TextStyle(
        color: color ?? Colors.black,
        decoration: textDecoration,
        fontSize: size ?? 15,
        overflow: TextOverflow.ellipsis,
        fontWeight: fontWeight,
        fontFamily: fontFamily
    ),
      textAlign: textAlignment,
    );
  }
}