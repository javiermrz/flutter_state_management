import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_management/src/blocs/progress_bar_bloc/bloc.dart';
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
          canvasColor: Colors.transparent),
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
  final progressBarBloc = ProgressBarBloc();
  double _globalProgressBarValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: BlocBuilder<ProgressBarBloc, ProgressBarState>(
          bloc: progressBarBloc,
          builder: (context, ProgressBarState state) {
            if (state is InitialProgressBarState) {
              return _buildProgressIndicator(0.5);
            } else if (state is ProgressBarLoading) {
              return _buildLoading();
            } else if (state is ProgressBarLoaded) {
              return _buildProgressIndicator(state.progressBarValue);
            } else
              return Center();
          },
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

  Widget _buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildProgressIndicator(double progressValue) {
    _globalProgressBarValue = progressValue;
    return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          Text(
            'Click some button to move me',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          MyProgressBar(value: progressValue)
        ]));
  }

  _increaseProgressBarValue() {
    progressBarBloc.dispatch(Increase(_globalProgressBarValue));
  }

  _decreaseProgressBarValue() {
    progressBarBloc.dispatch(Decrease(_globalProgressBarValue));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
