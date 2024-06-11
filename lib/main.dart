import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:home_challenge_kanban_task/firebase_options.dart';
import 'package:home_challenge_kanban_task/provider/create-task-provider.dart';
import 'package:home_challenge_kanban_task/provider/custom-theme-provider.dart';
import 'package:home_challenge_kanban_task/provider/loading-provider.dart';
import 'package:home_challenge_kanban_task/provider/schedule-provider.dart';
import 'package:home_challenge_kanban_task/provider/tab-bar-provider.dart';
import 'package:home_challenge_kanban_task/routes/routes-names.dart';
import 'package:home_challenge_kanban_task/routes/routes.dart';
import 'package:home_challenge_kanban_task/view/splash-view.dart';

import 'package:provider/provider.dart';

import 'package:sizer/sizer.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context,orientation,deviceType){
      return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_)=>TabBarProvider()),
          ChangeNotifierProvider(create: (_)=>CreateTaskProvider()),
          ChangeNotifierProvider(create: (_)=>ThemeProvider()),
          ChangeNotifierProvider(create: (_)=>ScheduleProvider()),
          ChangeNotifierProvider(create: (_)=>LoadingProvider()),
        ],
        child: Builder(builder: (context){
          final provider = Provider.of<ThemeProvider>(context, listen: false);
          return FutureBuilder(
            future: provider.init(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return GestureDetector(
                  onTap: (){
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  child: MaterialApp(
                    debugShowCheckedModeBanner: false,
                    theme: ThemeData(
                        fontFamily: 'Poppins',
                        elevatedButtonTheme:  ElevatedButtonThemeData(
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(provider.backgroundColor)
                            )
                        )
                    ),
                  // home: const SplashView(),
                    onGenerateRoute: Routes.generateRoute,
                    initialRoute: RoutesNames.splashView,
                  ),
                );
              }
              return const MaterialApp(
                home: Scaffold(body: Center(child: CircularProgressIndicator())),
              );
            },
          );        }),
      );
    });
  }
}

