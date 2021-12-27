import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'acc_create_page_state.dart';

class AccCreatePageCubit extends Cubit<AccountCreatePageState> {
  AccCreatePageCubit() : super(AccountCreatePageInitial());



}

