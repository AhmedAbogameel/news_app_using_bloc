import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_using_bloc/counterApp/lib/Home/cubit/states.dart';

class CounterCubit extends Cubit<CounterStates>{

  CounterCubit() : super(CounterInitialState());

  static CounterCubit get(context) => BlocProvider.of(context);

  int count = 0;

  void add(){
    count++;
    emit(CounterAddState(count.toString()));
  }

  void minus(){
    count--;
    emit(CounterMinusState(count.toString()));
  }

}