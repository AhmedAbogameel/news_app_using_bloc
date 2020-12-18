import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_using_bloc/views/apple/view.dart';
import 'package:news_app_using_bloc/views/business/view.dart';
import 'package:news_app_using_bloc/views/home/bloc/states.dart';
import 'bloc/cubit.dart';

class HomeView extends StatelessWidget {
  final List<Widget> homeContent = [BusinessView(), AppleView()];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_)=> HomeCubit(),
      child: BlocConsumer<HomeCubit,HomeStates>(
        listener: (_, __) {},
        builder: (ctx, state) {
          final homeCubit = HomeCubit.get(ctx);
          return Scaffold(
            appBar: AppBar(),
            body: homeContent[homeCubit.index],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: homeCubit.index,
              onTap: (index)=> homeCubit.changeIndexTo(index),
              items: ['Business','Apple'].map((e) => BottomNavigationBarItem(
                label: e,
                icon: Text(''),
              )).toList(),
            ),
          );
        },
      ),
    );
  }
}