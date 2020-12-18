import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_using_bloc/views/apple/bloc/cubit.dart';
import 'package:news_app_using_bloc/views/business/bloc/cubit.dart';
import 'package:news_app_using_bloc/views/home/view.dart';
import 'counterApp/lib/Home/cubit/cubit.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: CounterCubit()),
        BlocProvider.value(value: BusinessCubit()..getArticles()),
        BlocProvider.value(value: AppleCubit()..getArticles()),
      ],
      child: MaterialApp(
        // home: HomeView(),
        home: HomeView(),
      ),
    );
  }
}