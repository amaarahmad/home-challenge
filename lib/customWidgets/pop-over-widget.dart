import 'package:flutter/material.dart';
import 'package:home_challenge_kanban_task/customWidgets/my-text.dart';
import 'package:home_challenge_kanban_task/utils/app-assets.dart';
import 'package:home_challenge_kanban_task/utils/colors.dart';
import 'package:popover/popover.dart';

class PopOverWidgetForTask extends StatelessWidget {
  final VoidCallback deleteFunction;
  final VoidCallback editFunction;

  const PopOverWidgetForTask({super.key,
    required this.deleteFunction,
    required this.editFunction,
   });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
       color: lightCyan
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: deleteFunction,
            child: Container(
              height: 40,
              width: 150,
              decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //getWidth(10).width,
                  const Icon(Icons.delete,color: Colors.red,),
                  MyText(text: "Delete task",size: 10,
                    fontWeight: FontWeight.w700,color: blackColor,
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: editFunction,
            child: Container(
              height: 40,
              width: 150,
              decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //getWidth(10).width,
                  const Icon(Icons.edit,color: blackColor,),
                  MyText(text: "Edit task",size: 10,
                    fontWeight: FontWeight.w700,color: blackColor,
                  )
                ],
              ),
            ),
          ),


        ],
      ),
    );
  }
}

class TaskPopOver extends StatelessWidget {
  final VoidCallback deleteFunction;
  final VoidCallback editFunction;
  const TaskPopOver({
    super.key, required this.deleteFunction,
    required this.editFunction});

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: (){
      showPopover(
          context: context,
          bodyBuilder: (context) =>  PopOverWidgetForTask(deleteFunction: deleteFunction,editFunction: editFunction,),
          onPop: () => print('Popover was popped!'),
          direction: PopoverDirection.bottom,
          width: 180,
          height: 140,
          arrowHeight: 15,
          arrowWidth: 30,
          backgroundColor: whiteColor
      );
    }, icon: const Icon(Icons.more_vert,color: whiteColor,size: 24,))
    ;
  }
}
