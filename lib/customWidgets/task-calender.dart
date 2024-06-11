import 'package:flutter/material.dart';
import 'package:home_challenge_kanban_task/provider/create-task-provider.dart';
import 'package:home_challenge_kanban_task/utils/colors.dart';
import 'package:provider/provider.dart';

class TaskCalender extends StatelessWidget {
  const TaskCalender({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CreateTaskProvider>(builder: (context,provider,child){
      return IconButton(onPressed: ()async{
        DateTime? date = await showDatePicker(
          helpText: "",
          builder: (BuildContext context, Widget? child) {
            return Theme(
              data: ThemeData(
                colorScheme: const ColorScheme.light(primary: taskBgColor)
                    .copyWith(background: taskBgColor),
              ),
              child: child!,
            );
          },
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(DateTime.now().year),
          lastDate: DateTime(2100),
        );
        if (date != null) {
          provider.setDate(date);
          print(date);
        }
      }, icon: const Icon(Icons.calendar_month_rounded, color: whiteColor,
      ));
    });
  }
}
