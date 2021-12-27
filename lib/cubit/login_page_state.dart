part of 'login_page_cubit.dart';

@immutable
abstract class LoginScreenState extends Equatable {
  const LoginScreenState();

  @override
  List<Object?> get props => [];
}

class LoginScreenInitial extends LoginScreenState {
  const LoginScreenInitial();

  @override
  List<Object?> get props => [];
}

class LoginScreenLoading extends LoginScreenState {
  const LoginScreenLoading();

  @override
  List<Object?> get props => [];
}

class LoginScreenAuthorization extends LoginScreenState {
  final String loginStatus;

  const LoginScreenAuthorization({this.loginStatus = "no_status"});

  @override
  List<Object?> get props => [loginStatus];
}
