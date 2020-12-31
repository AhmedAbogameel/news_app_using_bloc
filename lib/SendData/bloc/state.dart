abstract class OrdersStates {}

class OrdersInitState extends OrdersStates {}

class OrderSuccessState extends OrdersStates {}

class OrdersLoadingState extends OrdersStates {}

class OrdersErrorState extends OrdersStates {
  String error;
  OrdersErrorState(this.error);
}





abstract class ButtonStates {}

class ButtonInitState extends ButtonStates {}

class ButtonLoading extends ButtonStates {}

class ButtonStopLoading extends ButtonStates {}
