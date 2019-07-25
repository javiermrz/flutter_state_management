import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ProgressBarState extends Equatable {
  ProgressBarState([List props = const []]) : super(props);
}

class InitialProgressBarState extends ProgressBarState {}

class ProgressBarLoading extends ProgressBarState {}

class ProgressBarLoaded extends ProgressBarState {
  final double progressBarValue;

  ProgressBarLoaded(this.progressBarValue) : super([progressBarValue]);
}
