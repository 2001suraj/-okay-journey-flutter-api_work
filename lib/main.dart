// ignore_for_file: must_be_immutable

import 'package:api_work/business%20logic/Apis/apis_bloc.dart';
import 'package:api_work/data/repo/user_reop.dart';
import 'package:api_work/presentation/routes/app_route.dart';
import 'package:api_work/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => ApisBloc(UserRepo())..add(AddApisEvent()),
    child: MyApp(
      route: AppRoute(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key, required this.route});
  AppRoute route;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Api work',
      initialRoute: HomeScreen.routeName,
      onGenerateRoute: route.onGenerateRoute,
    );
  }
}
