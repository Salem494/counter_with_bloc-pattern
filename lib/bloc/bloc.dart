import 'package:counterwithbloc/bloc/event.dart';
import 'package:counterwithbloc/bloc/state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int count = 0;

  static CounterBloc get(BuildContext context) => BlocProvider.of(context);

  CounterBloc(CounterState initialState) : super(initialState);
  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    if (event is IncrementCounterValue) {
      yield* _changeValue('in');
    }
    if (event is DecrementCounterValue) {
      yield* _changeValue('de');
    }
  }
  Stream<CounterState> _changeValue(String s) async* {
    switch (s) {
      case 'in':
        count++;
        break;
      case 'de':
        if (count != 0) {
          count--;
        }
        break;
    }
    yield SuccessCounterState(s);
  }
}
