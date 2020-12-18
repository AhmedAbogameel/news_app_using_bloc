import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_using_bloc/views/apple/bloc/states.dart';

class AppleCubit extends Cubit<AppleStates>{
  AppleCubit():super(AppleInitialState());
  static AppleCubit get (context)=> BlocProvider.of(context);

  List articles = [];

  Future<void> getArticles()async{
    emit(AppleLoadingState());
    Dio dio = Dio();
    dio.options.baseUrl = 'http://newsapi.org';
    await dio.get(
      '/v2/everything?q=apple&from=2020-12-17&to=2020-12-17&sortBy=popularity&apiKey=df1a070b89e64ce78ba286cea86af31b',
    ).then((value){
      articles = value.data['articles'] as List;
      emit(AppleSuccessState());
    }).catchError((e){
      emit(AppleErrorState(e.toString()));
    });
  }
}