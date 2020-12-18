import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_using_bloc/views/home/bloc/states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitState());
  static HomeCubit get(context)=> BlocProvider.of(context);

  int index = 0;

  void changeIndexTo (int index){
    this.index = index;
    emit(HomeChangeIndexState());
  }
}