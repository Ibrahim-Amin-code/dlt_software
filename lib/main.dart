// ignore_for_file: prefer_const_constructors

import 'package:bloc/bloc.dart';
import 'package:dlt_software/bussiness_logic/app_cubit/app_cubit.dart';
import 'package:dlt_software/bussiness_logic/home_cubit/home_cubit.dart';
import 'package:dlt_software/presentation/screens/home_page/home_page_screen.dart';
import 'package:dlt_software/presentation/screens/layout/layout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'network/bloc_observer.dart';
import 'network/dio.dart';
import 'network/shard_prefs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await startShared();

  // ignore: deprecated_member_use
  BlocOverrides.runZoned(
    () {
      runApp(MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppCubit>(
            create: (context) => AppCubit()..changeNotificationActive()),
        BlocProvider<HomeCubit>(
            create: (context) => HomeCubit()..getHomeData()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const BottomNave(
          index: 0,
        ),
      ),
    );
  }
}
