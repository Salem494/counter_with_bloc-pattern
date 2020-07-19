

abstract class CounterState{
  const CounterState();
}

class InitialCounterState extends CounterState{}
class SuccessCounterState extends CounterState
{
  final String type;

  SuccessCounterState(this.type);
}
