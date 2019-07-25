import 'package:flutter/material.dart';
import 'package:flutter_state_management/src/style.dart';

class MyProgressBar extends StatelessWidget {
  final double value;
  MyProgressBar({@required this.value});
  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      backgroundColor: appSecondaryColor,
      valueColor: AlwaysStoppedAnimation(appAccentColor),
      value: value,
    );
  }
}
