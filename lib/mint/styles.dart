import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'colors.dart';

class AppStyles {

  static final OutlineInputBorder inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(2.w)),
    borderSide: const BorderSide(
        color: AppColors.mainColor,
        width: 2.0,
        style: BorderStyle.solid
    ),
  );

  static final TextStyle inputTextStyle = TextStyle(color: AppColors.mainColor, fontSize: 16.sp);



}
