import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreateTaskProvider extends ChangeNotifier{
  String _defaultPriority='Low';
  String _initialTaskDate='Select Date';
  TimeOfDay _timeOfDay=TimeOfDay.now();
  TimeOfDay get timeOfDay=> _timeOfDay;
  DateTime _initialDate=DateTime.now();
  DateTime get initialDate=>_initialDate;
  String get initialTaskDate=>_initialTaskDate;
  String get defaultPriority=>_defaultPriority;
  final taskNameController=TextEditingController();
  final taskDescriptionController=TextEditingController();
  void changeSelectedTab(String newPriority){
    _defaultPriority=newPriority;
    notifyListeners();
  }

set initialTaskDate(String date){
 _initialTaskDate=date;
  }

  set defaultPriority(String priority){
 _defaultPriority=priority;
  }
  void setDate(DateTime newDate){
    _initialDate=newDate;
    _initialTaskDate=DateFormat('EE,d MMMM').format(newDate);
    notifyListeners();
  }

  void clearResources(){
    taskNameController.text='';
   taskDescriptionController.text='';
    initialTaskDate='Select date';
   defaultPriority='Low';
  }
}