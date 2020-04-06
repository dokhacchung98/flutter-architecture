import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BuildLoading extends StatelessWidget {
  const BuildLoading({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}