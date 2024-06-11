import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:home_challenge_kanban_task/customWidgets/my-text.dart';
import 'package:home_challenge_kanban_task/provider/custom-theme-provider.dart';
import 'package:home_challenge_kanban_task/utils/colors.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ProfileWidget extends StatelessWidget {
  final String title;
  final String iconUrl;
  final VoidCallback? onPressed;
  const ProfileWidget({super.key,required this.title,required this.iconUrl,
    this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    final colorProvider = Provider.of<ThemeProvider>(context);

    return  ListTile(
      onTap: onPressed??(){
        debugPrint("Pressed");
      },
      leading: Image.asset(iconUrl,color: colorProvider.backgroundColor,
        scale: 1.5,
      ),
      title: MyText(text: title,
        size: 12.sp,
        color: headingTextColor,
        fontWeight: FontWeight.w600,
      ),
    ).animate().
    fade(duration: const Duration(milliseconds: 800))
        .moveX(duration: const Duration(milliseconds: 800));
  }
}
