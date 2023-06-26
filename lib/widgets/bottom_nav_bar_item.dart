import 'package:design/theme/theme.dart';
import 'package:flutter/material.dart';

class BottomNavBarItem extends StatelessWidget {
  const BottomNavBarItem({
    super.key,
    required this.deactivepath,
    required this.activePath,
    required this.activeValue,
    required this.value,
    required this.onTap,
  });

  final String deactivepath;
  final String activePath;
  final int activeValue;
  final int value;
  final void Function(int value) onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          child: Image.asset(
            value == activeValue ? activePath : deactivepath,
            scale: 1,
          ),
          onTap: () {
            onTap(value);
          },
        ),
        activeValue == value
            ? Padding(
                padding: const EdgeInsets.only(top: 6),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  height: 5,
                  width: 5,
                  decoration: BoxDecoration(
                    color: CustomTheme.samoanSun,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
