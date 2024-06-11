import 'package:flutter/foundation.dart';

class TabBarProvider extends ChangeNotifier{
  String _selectedTab='my-task';
  String _selectedDropdown='My Task';
  String get selectedDropdown=>_selectedDropdown;
  final List<String> items = [
    'My Task',
    'In-progress',
    'Pending',
    'Completed',
  ];

  String get selectedTab=>_selectedTab;
  void changeSelectedTab(String newTab){
    _selectedTab=newTab;
    notifyListeners();
  }
  void changeDropdown(String newTab){
     _selectedDropdown=newTab;
    notifyListeners();
  }
}