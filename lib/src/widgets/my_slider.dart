import 'package:flutter/material.dart';
import 'package:flutter_state_management/src/style.dart';

class MySlider extends StatefulWidget {
  MySlider();

  @override
  _MySliderState createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  double _value = 0.6;

  @override
  Widget build(BuildContext context) {
    Color primaryColor = appAccentColor;
    return Slider(
      activeColor: primaryColor,
      inactiveColor: Colors.blueGrey[800],
      value: _value,
      onChanged: (value) => _handleOnChange(value),
    );
  }

  _handleOnChange(value) {
    setState(() {
      _value = value;
    });
  }
}
