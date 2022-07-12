import 'package:covid_tracker_app/cubit/internet_cubit.dart';
import 'package:covid_tracker_app/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'utils/constants.dart';
import 'utils/custom_theme.dart';
import 'views/error_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InternetCubit(),
      child: BlocBuilder<InternetCubit, InternetState>(
        builder: (context, state) {
          if (state == InternetState.Gained) {
            return GetMaterialApp(
              title: 'Covid-X Tracker',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                brightness: Brightness.light,
                primaryColor: appPrimaryColor,
                textTheme: customTextTheme(),
              ),
              home: const SplashScreen(),
            );
          } else if (state == InternetState.Lost) {
            return MaterialApp(
              title: 'Covid-X Tracker',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                brightness: Brightness.light,
                primaryColor: appPrimaryColor,
                textTheme: customTextTheme(),
              ),
              home: const ErrorScreen(),
            );
          } else {
            return MaterialApp(
              title: 'Covid-X Tracker',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                brightness: Brightness.light,
                primaryColor: appPrimaryColor,
                textTheme: customTextTheme(),
              ),
              home: const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
