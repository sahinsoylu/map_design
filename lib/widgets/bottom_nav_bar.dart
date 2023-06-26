import 'package:design/utilities/responsive.dart';
import 'package:design/widgets/bottom_nav_bar_item.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int activeValue = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: Responsive.heightPercent(context, 8),
      color: Colors.white,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            BottomNavBarItem(
              onTap: (value) {
                setState(() {
                  activeValue = value;
                });
              },
              deactivepath: "assets/png/home.png",
              activePath: "assets/png/home_filled.png",
              activeValue: activeValue,
              value: 0,
            ),
            BottomNavBarItem(
              onTap: (value) {
                setState(() {
                  activeValue = value;
                });
              },
              deactivepath: "assets/png/3d-rotate.png",
              activePath: "assets/png/3d-rotate_filled.png",
              activeValue: activeValue,
              value: 1,
            ),
            BottomNavBarItem(
              onTap: (value) {
                setState(() {
                  activeValue = value;
                });
              },
              deactivepath: "assets/png/clock.png",
              activePath: "assets/png/clock_filled.png",
              activeValue: activeValue,
              value: 2,
            ),
            BottomNavBarItem(
              onTap: (value) {
                setState(() {
                  activeValue = value;
                });
              },
              deactivepath: "assets/png/profile-circle.png",
              activePath: "assets/png/profile-circle_filled.png",
              activeValue: activeValue,
              value: 3,
            )
          ],
        ),
      ),
    );
  }
}
