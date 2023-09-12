import 'package:flutter/material.dart';

class AppBarComponentWidget extends StatelessWidget {
  AppBarComponentWidget({required this.title, super.key});
  String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 23,
        ),
      ),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.blue,
            Colors.red,
          ]),
        ),
      ),
    );
  }
}
