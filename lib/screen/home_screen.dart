import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final Color color;

  const HomeScreen({
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.0,
      height: 150.0,
      color: color,
    );
  }
}
