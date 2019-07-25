import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ProgressBarEvent extends Equatable {
  ProgressBarEvent([List props = const []]) : super(props);
}

class Increase extends ProgressBarEvent {
  final double previousValue;

  Increase(this.previousValue) : super([previousValue]);
}

class Decrease extends ProgressBarEvent {
  final double previousValue;

  Decrease(this.previousValue) : super([previousValue]);
}
