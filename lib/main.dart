import 'package:flutter/material.dart';
import 'package:flutter_state_management/src/widgets/my_button.dart';
import 'package:flutter_state_management/src/widgets/my_slider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter State Management Demo',
      theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.orange,
          canvasColor: Colors.transparent
          //primarySwatch: Colors.blue,
          ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Click some button to move me',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            MySlider()
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          MyButton(
            icon: Icons.remove,
            onPressed: _increaseSliderValue,
          ),
          MyButton(
            icon: Icons.add,
            onPressed: _increaseSliderValue,
          ),
        ],
      ),
    );
  }

  _increaseSliderValue() {
    //Some logic here
  }
  _decreaseSliderValue() {
    //Some logic here
  }
}
