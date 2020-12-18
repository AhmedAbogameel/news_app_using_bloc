import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/cubit.dart';
import 'bloc/states.dart';

class BusinessView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BusinessCubit, BusinessStates>(
        listener: (ctx, state) {
          if (state is BusinessErrorState) Scaffold.of(ctx).showSnackBar(SnackBar(content: Text(state.error)));
        },
        builder: (ctx, state) {
          final homeCubitArticles = BusinessCubit.get(context).articles;
          return ConditionalBuilder(
            condition: state is BusinessSuccessState,
            builder: (_)=> homeCubitArticles.isEmpty ? Center(child: Text('No Articles'),) : ListView.builder(
              itemCount: homeCubitArticles.length,
              itemBuilder: (_, i) => ListTile(
                leading: Image.network(homeCubitArticles[i]['urlToImage']),
                title: Text(homeCubitArticles[i]['title']),
                subtitle: Text(homeCubitArticles[i]['publishedAt']),
              ),
            ),
            fallback: (_)=> Center(child: CircularProgressIndicator()),
          );
        },
    );
  }
}
