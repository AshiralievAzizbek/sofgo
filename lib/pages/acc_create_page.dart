import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:sofgo/cubit/acc_create_page_cubit.dart';
import 'package:sofgo/mint/colors.dart';
import 'package:sofgo/mint/styles.dart';

class AccountCreatePage extends StatelessWidget {
  const AccountCreatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BlocConsumer<AccCreatePageCubit, AccountCreatePageState>(
            listener: (context, state) {

            },
            builder: (context, state) {
              if (state is AccountCreatePageInitial) {
                return FirstStage();
              }

              return Column();
            },
          )),
    );
  }
}


class FirstStage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 4.h,
          child: Row(
            children: const [
              Icon(Icons.arrow_back_ios),
              Text("Шаг 1/2", style: TextStyle(
                color: AppColors.mainColor,
                fontSize: 18
              ),),


            ],
          ),
        ),
        SizedBox(
          height: 4.h,
          child: Row(
            children: [
              Icon(Icons.arrow_back_ios),

            ],
          ),
        )
      ],
    );
  }

}

class SecondStage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [],
        )
      ],
    );
  }

}

