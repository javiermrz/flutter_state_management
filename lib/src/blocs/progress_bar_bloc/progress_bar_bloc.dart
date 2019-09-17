import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class ProgressBarBloc extends Bloc<ProgressBarEvent, ProgressBarState> {
  @override
  ProgressBarState get initialState => InitialProgressBarState();
  StreamSubscription progressBarValuesSubscription;

  @override
  Stream<ProgressBarState> mapEventToState(
    ProgressBarEvent event,
  ) async* {
    double nextValue;
    yield ProgressBarLoading();
    if (event is Increase) {
      nextValue =
          await _fetchNextValueOnIncreaseFromFakeApi(event.previousValue);
    } else if (event is Decrease) {
      nextValue =
          await _fetchNextValueOnDecreaseFromFakeApi(event.previousValue);
    }
    yield ProgressBarLoaded(nextValue);
  }

  Future<double> _fetchNextValueOnIncreaseFromFakeApi(double previousValue) {
    previousValue = num.parse(previousValue.toStringAsFixed(2));
    return Future.delayed(Duration(milliseconds: 1000), () {
      return previousValue < 1 ? previousValue + 0.1 : previousValue;
    });
  }

  Future<double> _fetchNextValueOnDecreaseFromFakeApi(double previousValue) {
    previousValue = num.parse(previousValue.toStringAsFixed(2));
    return Future.delayed(Duration(milliseconds: 1000), () {
      return previousValue > 0 ? previousValue - 0.1 : previousValue;
    });
  }
}
