import 'package:flutter/material.dart';
import 'package:instagram_stories/navigator.dart';

class HomeNavigator extends AppNavigator{
  HomeNavigator({required BuildContext context}) : super(context: context);

  void closeDialog() {
    Navigator.of(context).pop(context);
  }
}