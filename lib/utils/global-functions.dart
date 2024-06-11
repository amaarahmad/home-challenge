import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void customPrint(String e){
  debugPrint(e.toString());
}

String changeFormat(DateTime dateTime){
  return DateFormat('EE, d MMMM').format(dateTime);
}
String getDifferenceString(DateTime startDate, DateTime endDate) {
  Duration difference = endDate.difference(startDate);

  int years = difference.inDays ~/ 365;
  int months = (difference.inDays % 365) ~/ 30;
  int days = (difference.inDays % 365) % 30;
  int hours = difference.inHours % 24;
  int minutes = difference.inMinutes % 60;
  int seconds = difference.inSeconds % 60;

  String differenceString = '';

  if (years > 0) differenceString += '$years years ';
  if (months > 0) differenceString += '$months months ';
  if (days > 0) differenceString += '$days days ';
  if (hours > 0) differenceString += '$hours hours ';

  return differenceString.trim();
}
String calculateTimeDifference(DateTime start, DateTime end) {
  Duration difference = end.difference(start);
  int hours = difference.inHours;
  int minutes = difference.inMinutes % 60;
  int seconds = difference.inSeconds % 60;

  return '$hours hours, $minutes minutes, $seconds seconds';
}