abstract class AppleStates {}

class AppleInitialState extends AppleStates {}

class AppleLoadingState extends AppleStates {}

class AppleSuccessState extends AppleStates {}

class AppleErrorState extends AppleStates {
  String error;
  AppleErrorState(this.error);
}