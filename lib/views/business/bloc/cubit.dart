import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'states.dart';

class BusinessCubit extends Cubit<BusinessStates>{
  BusinessCubit() : super(BusinessInitialState());
  static BusinessCubit get(context)=> BlocProvider.of(context);

  List articles = [];

  Future<void> getArticles()async{
    emit(BusinessLoadingState());
    Dio dio = Dio();
    dio.options.baseUrl = 'http://newsapi.org';
    await dio.get(
      '/v2/top-headlines',
      queryParameters: {
        'country':'eg',
        'category':'business',
        'apiKey':'df1a070b89e64ce78ba286cea86af31b'
      },
    ).then((value){
      articles = value.data['articles'] as List;
      emit(BusinessSuccessState());
    }).catchError((e)=>
      emit(BusinessErrorState(e.toString()))
    );
  }
}