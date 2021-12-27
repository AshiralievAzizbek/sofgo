import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'login_page_state.dart';

class LoginScreenCubit extends Cubit<LoginScreenState> {
  LoginScreenCubit() : super(const LoginScreenInitial());

  Future<void> confirmNumber(String text) async {
    log(text);
    emit(const LoginScreenLoading());
    await Future.delayed(const Duration(seconds: 2), () {
      emit(const LoginScreenAuthorization());
    });
  }

  Future<void> confirmSms(String text) async {
    emit(const LoginScreenLoading());
    await Future.delayed(const Duration(seconds: 2), () {
      emit(const LoginScreenAuthorization(loginStatus: "new_user"));
    });
  }
}
