import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sofgo/cubit/acc_create_page_cubit.dart';
import 'package:sofgo/cubit/home_page_cubit.dart';
import 'package:sofgo/cubit/login_page_cubit.dart';
import 'package:sofgo/mint/colors.dart';
import 'package:sizer/sizer.dart';
import 'package:sofgo/pages/acc_create_page.dart';
import 'package:sofgo/pages/feature_page.dart';
import 'package:sofgo/pages/home_page.dart';
import 'package:sofgo/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeScreenCubit>(
      create: (context) => HomeScreenCubit(),
      child: Sizer(builder: (context, orientation, deviceType) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.homeScreenBgColor,
            primarySwatch: Colors.blue,
          ),
          home: const HomePage(),
        );
      }),
    );
  }
}
