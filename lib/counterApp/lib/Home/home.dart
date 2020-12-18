import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_using_bloc/counterApp/lib/Home/cubit/cubit.dart';
import 'package:news_app_using_bloc/counterApp/lib/Home/cubit/states.dart';

class CounterHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CounterCubit, CounterStates>(
      listener: (context, state) {
        if (state is CounterAddState) print('After Add : ${state.number}');
        if (state is CounterMinusState) print('After minus : ${state.number}');
      },
      builder: (context, state) {
        final counterCubit = CounterCubit.get(context);
        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  heroTag: 'minus',
                  child: Text('Minus'),
                  onPressed: () => counterCubit.minus(),
                ),
                Text(
                  counterCubit.count.toString(),
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.w900),
                ),
                FloatingActionButton(
                  heroTag: 'add',
                  child: Text('Add'),
                  onPressed: () => counterCubit.add(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}