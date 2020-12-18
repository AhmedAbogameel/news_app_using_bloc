import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_using_bloc/views/apple/bloc/cubit.dart';
import 'package:news_app_using_bloc/views/apple/bloc/states.dart';

class AppleView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppleCubit,AppleStates>(
      listener: (_,__) {},
      builder: (ctx,state)=> ConditionalBuilder(
        condition: state is AppleSuccessState,
        builder: (_){
          final articles = AppleCubit.get(context).articles;
          return articles.isEmpty ? Text('No Articles') : ListView.builder(
            itemBuilder: (_, i) => ListTile(
              leading: Image.network(articles[i]['urlToImage']),
              title: Text(articles[i]['title']),
              subtitle: Text(articles[i]['publishedAt']),
            ),
          );
        },
        fallback: (_)=> Center(child: CircularProgressIndicator(),),
      ),
    );
  }
}
