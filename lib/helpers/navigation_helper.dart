import 'package:flutter/material.dart';

void changePage(BuildContext context, Widget widget){
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}

void changePageReplacement(BuildContext context, Widget widget){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => widget));
}

void navigateBack(BuildContext context){
    Navigator.pop(context);
}

