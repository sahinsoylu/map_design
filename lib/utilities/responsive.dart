import 'package:flutter/material.dart';

class Responsive {
  static double heightPercent(BuildContext context, double percent) {
    return (MediaQuery.of(context).size.height / 100) * percent;
  }

  static double widthPercent(BuildContext context, double percent) {
    return (MediaQuery.of(context).size.width / 100) * percent;
  }
}
