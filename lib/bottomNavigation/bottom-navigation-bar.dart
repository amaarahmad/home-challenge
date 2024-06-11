
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:home_challenge_kanban_task/provider/custom-theme-provider.dart';
import 'package:home_challenge_kanban_task/utils/colors.dart';
import 'package:home_challenge_kanban_task/view/home-view.dart';
import 'package:home_challenge_kanban_task/view/profile-view.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';


class KanbanBottomBar extends StatefulWidget {
  const KanbanBottomBar({super.key});

  @override
  State<KanbanBottomBar> createState() => _KanbanBottomBarState();
}

class _KanbanBottomBarState extends State<KanbanBottomBar> {
  final _pageController = PageController(initialPage: 0);

  final NotchBottomBarController _controller = NotchBottomBarController(index: 0);

  int maxCount = 5;

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorProvider = Provider.of<ThemeProvider>(context);

    final List<Widget> bottomBarPages = [
      const HomeView(),
      const ProfileView(),
    ];
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(bottomBarPages.length, (index) => bottomBarPages[index]),
      ),
      extendBody: true,
      bottomNavigationBar: (bottomBarPages.length <= maxCount)
          ? AnimatedNotchBottomBar(
        notchBottomBarController: _controller,
        color: whiteColor,
        showLabel: true,
        textOverflow: TextOverflow.visible,
        maxLine: 1,
        shadowElevation: 5,
        kBottomRadius: 1,
        showBlurBottomBar: true,
        // notchShader: const SweepGradient(
        //   startAngle: 0,
        //   endAngle: pi / 2,
        //   colors: [Colors.red, Colors.green, Colors.orange],
        //   tileMode: TileMode.mirror,
        // ).createShader(Rect.fromCircle(center: Offset.zero, radius: 8.0)),
        notchColor: colorProvider.backgroundColor.withOpacity(0.3),

        removeMargins: false,
        bottomBarWidth: 10,
        showShadow: false,
        durationInMilliSeconds: 300,

        itemLabelStyle: const TextStyle(fontSize: 10),

        elevation: 1,
        bottomBarItems:  [

          BottomBarItem(
            inActiveItem: const Icon(
              Icons.home_filled,
              color: Colors.blueGrey,
            ),
            activeItem: Icon(
              Icons.home_filled,
              color: colorProvider.backgroundColor,
            ),
            itemLabel: 'Home',
          ),
          BottomBarItem(
            inActiveItem: const Icon(
              Icons.person,
              color: Colors.blueGrey,
            ),
            activeItem: Icon(
              Icons.person,
              color: colorProvider.backgroundColor,
            ),
            itemLabel: 'Profile',
          ),
        ],
        onTap: (index) {
          _pageController.jumpToPage(index);
        },
        kIconSize: 18.sp,
      )
          : null,
    );
  }
}


