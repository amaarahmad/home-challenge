
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:home_challenge_kanban_task/provider/custom-theme-provider.dart';
import 'package:home_challenge_kanban_task/provider/loading-provider.dart';
import 'package:home_challenge_kanban_task/utils/colors.dart';
import 'package:provider/provider.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool loading;
  final double?width;
  final double?height;
  final Color?textColor;
  final Color? bgColor;
  final double? btnTextSize;
  const RoundButton({
    super.key,
    required this.title,
    required this.onTap,
    this.loading=false,
    this.width,
    this.height,
    this.textColor,
    this.bgColor,
    this.btnTextSize
  });
  @override
  Widget build(BuildContext context) {
    final colorProvider = Provider.of<ThemeProvider>(context);

    return Consumer<LoadingProvider>
      (builder: (context,provider,child){
      return  InkWell(
        onTap: onTap,
        child: Container(
          height:height?? 42,
          width:width?? double.infinity,
          decoration: BoxDecoration(
              color:bgColor?? lightCyan,
              gradient: LinearGradient(colors: [
                colorProvider.backgroundColor,
                headingTextColor.withOpacity(0.6)
              ],begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
              ),

              borderRadius: BorderRadius.circular(11)
          ),
          child: Center(
              child:provider.isLoading?const SpinKitRipple
                (color: Colors.white,size: 10,):
              Text(
                title,
                style: TextStyle(
                    color: textColor??whiteColor,
                    fontFamily: 'Montserrat',
                    fontSize:btnTextSize?? 15,
                    fontWeight: FontWeight.w700),
              )
          ),
        ),

      );
    });
  }
}