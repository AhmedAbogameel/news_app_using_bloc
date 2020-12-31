import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_using_bloc/SendData/bloc/state.dart';
import 'package:dio/dio.dart';
import 'package:news_app_using_bloc/core/user.dart';
import 'model.dart';

class OrdersControllerCubit extends Cubit<OrdersStates>{
  OrdersControllerCubit() : super(OrdersInitState());

  static OrdersControllerCubit get (context)=> BlocProvider.of(context);

  ShowOrdersModel showOrdersModel;
  Dio _dio = Dio();

  Future<ShowOrdersModel> getOrders(String id)async{
    emit(OrdersLoadingState());
    final url = 'https://dvinastore.com/index.php?route=api/account/user_orders';
    FormData formData = FormData.fromMap({
      'logged': 'true',
      'customer_id': id,
    });
    final response = await _dio.post(url,data: formData);
    if(response.statusCode == 200){
      print(response.data);
      showOrdersModel = ShowOrdersModel.fromJson(response.data);
      User().setName(showOrdersModel.orders[0].name);
      emit(OrderSuccessState());
    }else{
      emit(OrdersErrorState('error'));
    }
    return showOrdersModel;
  }

}