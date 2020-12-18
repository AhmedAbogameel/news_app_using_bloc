abstract class CounterStates {}

class CounterInitialState extends CounterStates {}

class CounterAddState extends CounterStates {
  String number;
  CounterAddState(this.number);
}

class CounterMinusState extends CounterStates {
  String number;
  CounterMinusState(this.number);
}