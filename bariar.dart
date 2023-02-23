import 'package:flutter/material.dart';

class Mybariar extends StatelessWidget {
  final size;
  Mybariar({this.size});
  

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.green,
      ),
    );
  }
}