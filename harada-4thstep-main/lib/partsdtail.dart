import 'package:flutter/material.dart';

class PartsDtail extends StatelessWidget {
  const PartsDtail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('部品詳細'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () => {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) {
                return PartsDtail();
              }),
            ),
          },
          child: const Text(
            '表示',
            style: TextStyle(fontSize: 80),
          ),
        ),
      ),
    );
  }
}
