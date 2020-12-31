import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_using_bloc/SendData/bloc/cubit.dart';
import 'package:news_app_using_bloc/SendData/bloc/state.dart';

class SendData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_)=> OrdersControllerCubit()..getOrders('97'),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocConsumer<OrdersControllerCubit,OrdersStates>(
          listener: (_,state)=> state is OrdersErrorState ? print(state.error) : null,
          builder: (ctx,state){
            final cubit = OrdersControllerCubit.get(ctx);
            return state is OrderSuccessState ? ListView.builder(
              itemCount: cubit.showOrdersModel.orders.length,
              itemBuilder: (_,i)=> Text(cubit.showOrdersModel.orders[i].name),
            ) : Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
