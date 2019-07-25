import 'package:flutter/material.dart';
import 'package:flutter_state_management/src/style.dart';
import 'package:flutter_state_management/src/widgets/my_button.dart';
import 'package:flutter_state_management/src/widgets/my_progress_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter State Management Demo',
      theme: ThemeData(
        accentColor: appAccentColor,
        brightness: Brightness.dark,
        primarySwatch: Colors.orange,
        canvasColor: Colors.transparent,
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
            MyProgressBar(
              value: 0.5,
            )
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          MyButton(
            icon: Icons.remove,
            onPressed: _decreaseProgressBarValue,
          ),
          MyButton(
            icon: Icons.add,
            onPressed: _increaseProgressBarValue,
          ),
        ],
      ),
    );
  }

  _increaseProgressBarValue() {
    //Some logic here
  }
  _decreaseProgressBarValue() {
    //Some logic here
  }
}
