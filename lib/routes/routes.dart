

import 'package:flutter/material.dart';
import 'package:home_challenge_kanban_task/bottomNavigation/bottom-navigation-bar.dart';
import 'package:home_challenge_kanban_task/routes/routes-names.dart';
import 'package:home_challenge_kanban_task/view/all-task-view.dart';
import 'package:home_challenge_kanban_task/view/comment-view.dart';
import 'package:home_challenge_kanban_task/view/create-task-view.dart';
import 'package:home_challenge_kanban_task/view/customize-color-view.dart';
import 'package:home_challenge_kanban_task/view/home-view.dart';
import 'package:home_challenge_kanban_task/view/profile-view.dart';
import 'package:home_challenge_kanban_task/view/splash-view.dart';
import 'package:home_challenge_kanban_task/view/task-detail-view.dart';

class Routes{

  static Route <dynamic>generateRoute(RouteSettings routeSettings){
    switch (routeSettings.name){
      case RoutesNames.splashView:
        return MaterialPageRoute(builder: (BuildContext context)=> const SplashView(),settings: routeSettings);
      case RoutesNames.homeView:
        return MaterialPageRoute(builder: (BuildContext context)=> const HomeView(),settings: routeSettings);
      case RoutesNames.createTaskView:
        return MaterialPageRoute(builder: (BuildContext context)=> const CreateTaskView(),settings: routeSettings);
      case RoutesNames.allTaskView:
        return MaterialPageRoute(builder: (BuildContext context)=> const AllTaskView());
      case RoutesNames.taskDetailView:
        return MaterialPageRoute(builder: (BuildContext context)=> const TaskDetailView(),settings: routeSettings);
      case RoutesNames.commentView:
        return MaterialPageRoute(builder: (BuildContext context)=>  CommentView(),settings: routeSettings);
        case RoutesNames.kanbanBottomBar:
        return MaterialPageRoute(builder: (BuildContext context)=> const KanbanBottomBar());
        case RoutesNames.customizeColorView:
        return MaterialPageRoute(builder: (BuildContext context)=> const CustomizeColorView());
      case RoutesNames.profileView:
        return MaterialPageRoute(builder: (BuildContext context)=> const ProfileView());
      default:
        return MaterialPageRoute(builder: (_){
          return const Scaffold(
            body:Center(
              child: Text('No Screen Found'),
            ) ,
          );
        });
    }
  }
}