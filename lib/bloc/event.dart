import 'package:flutter/foundation.dart';

abstract class CounterEvent{

  const CounterEvent();
}

class IncrementCounterValue extends CounterEvent{}

class DecrementCounterValue extends CounterEvent{}