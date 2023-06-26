import 'package:design/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SortItem extends StatefulWidget {
  const SortItem({
    super.key,
    required this.activeItem,
    required this.value,
    required this.onTap,
    required this.child,
  });

  final int activeItem;
  final int value;
  final Widget child;
  final void Function(int value) onTap;

  @override
  State<SortItem> createState() => _SortItemState();
}

class _SortItemState extends State<SortItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(3),
      onTap: () {
        widget.onTap.call(widget.value);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: widget.activeItem == widget.value
              ? CustomTheme.samoanSun
              : Colors.white,
        ),
        child: Center(child: widget.child),
      ),
    );
  }
}
