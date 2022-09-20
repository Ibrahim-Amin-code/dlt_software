// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dlt_software/models/home_model.dart';
import 'package:dlt_software/network/dio.dart';
import 'package:dlt_software/network/network_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  // HomeModel homemodel = HomeModel();

  // void getHomeData() {
  //   emit(HomeLoadingState());
  //   DioHelper.getData(
  //     url: Home,
  //   ).then((value) {
  //     homemodel = HomeModel.fromJson(value.data);
  //     print(value.data);
  //     emit(HomeSuccessState());
  //     // return homemodel;
  //   }).catchError((error) {
  //     emit(HomeErrorState(error.toString()));
  //     print(error.toString());
  //   });
  // }

  HomeModel homeData = HomeModel();
  Map<String, String> requestHeaders = {
    // 'Accept': '*/*',
    // 'Accept-Encoding': 'gzip, deflate, br',
    // 'Connection': 'keep-alive',
    'Authorization': 'Basic YWRtaW46QWhtZWQyNDk5MjA4OUA=',
    // 'Host': '<calculated when request is sent>',
    // 'User-Agent': 'PostmanRuntime/7.29.2',
  };

  Future getHomeData() async {
    // homeData = [];
    emit(HomeLoadingState());
    try {
      var response = await http.get(
        Uri.parse(
          "https://dlt-software.com/wp-json/wp/v2/pages/3331",
        ).replace(queryParameters: {}),
        headers: requestHeaders,
      );

      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        homeData = HomeModel.fromJson(data);
        print(response.body);
        // for (var item in data) {
        //   categoryModel = CategoryModel.fromJson(item);
        //   category.add(categoryModel);
        // }
        emit(HomeSuccessState());
        return homeData;
      }
    } catch (error) {
      emit(HomeErrorState(error.toString()));
      print(" errorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr" + error.toString());
    }
    // return category;
  }
}
