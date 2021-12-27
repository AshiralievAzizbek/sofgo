import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:sofgo/cubit/login_page_cubit.dart';
import 'package:sofgo/mint/colors.dart';
import 'package:sofgo/mint/styles.dart';
import 'package:sofgo/pages/acc_create_page.dart';
import 'package:sofgo/pages/home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocConsumer<LoginScreenCubit, LoginScreenState>(
            listener: (context, state) {
              if (state is LoginScreenAuthorization && state.loginStatus == "authorized") {
                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (context) {
                  return const HomePage();
                }));
              }
              if (state is LoginScreenAuthorization && state.loginStatus == "new_user") {
                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (context) {
                  return const AccountCreatePage();
                }));
              }
            },
            builder: (context, state) {
              if (state is LoginScreenLoading) {
                return const CircularProgressIndicator();
              }
              if (state is LoginScreenInitial) {
                return LogInPage();
              }
              if (state is LoginScreenAuthorization) {
                return Authorization();
              }

              return _buildErrorScaffold();
            },
          ),
        ),
      ),
    );
  }
}

class Authorization extends StatelessWidget {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/images/logo.png", scale: 1.7),
        Padding(
          padding: EdgeInsets.only(top: 16.h),
          child: SizedBox(
            height: 6.h,
            width: 92.w,
            child: TextField(
              textAlign: TextAlign.center,
              controller: _textController,
              keyboardType: TextInputType.number,
              style: AppStyles.inputTextStyle,
              inputFormatters: [LengthLimitingTextInputFormatter(4)],
              decoration: InputDecoration(
                  focusedBorder: AppStyles.inputBorder,
                  enabledBorder: AppStyles.inputBorder,
                  labelText: "Введите СМС код",
                  labelStyle: AppStyles.inputTextStyle),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 2.h),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                elevation: 0.w,
                shadowColor: Colors.transparent,
                primary: AppColors.mainColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(2.w)))),
            onPressed: () {
              _confirmCode(context, _textController.text);
            },
            child: SizedBox(
              width: 84.w,
              height: 6.h,
              child: Center(
                child: Text(
                  "Подтвердить",
                  style: TextStyle(
                      color: AppColors.homeScreenBgColor, fontSize: 16.sp),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _confirmCode(BuildContext context, String text) {
    LoginScreenCubit _loginScreenCubit =
        BlocProvider.of<LoginScreenCubit>(context);
    _loginScreenCubit.confirmSms(text);
  }
}

Widget _buildErrorScaffold() {
  return Container();
}

class LogInPage extends StatelessWidget {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/images/logo.png", scale: 1.7),
        Padding(
          padding: EdgeInsets.only(top: 16.h),
          child: SizedBox(
            height: 6.h,
            width: 92.w,
            child: TextField(
              controller: _textController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                LengthLimitingTextInputFormatter(9),
              ],
              style: AppStyles.inputTextStyle,
              decoration: InputDecoration(
                  prefixText: "+998",
                  prefixStyle: AppStyles.inputTextStyle,
                  focusedBorder: AppStyles.inputBorder,
                  enabledBorder: AppStyles.inputBorder,
                  labelText: "Введите номер",
                  labelStyle: AppStyles.inputTextStyle),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 2.h),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                elevation: 0.w,
                shadowColor: Colors.transparent,
                primary: AppColors.mainColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(2.w)))),
            onPressed: () {
              _confirm(context, _textController.text);
            },
            child: SizedBox(
              width: 84.w,
              height: 6.h,
              child: Center(
                child: Text(
                  "Войти",
                  style: TextStyle(
                      color: AppColors.homeScreenBgColor, fontSize: 16.sp),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _confirm(BuildContext context, String text) {
    LoginScreenCubit _loginScreenCubit =
        BlocProvider.of<LoginScreenCubit>(context);
    _loginScreenCubit.confirmNumber(text);
  }
}
