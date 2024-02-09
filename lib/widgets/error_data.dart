import 'package:flutter/material.dart';

class ErrorData extends StatelessWidget {
  const ErrorData({super.key, required this.message, required this.height});

  final String message;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: Theme.of(context).colorScheme.primary,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: Center(
          child: FittedBox(
        child: Text(
          message,
          style:
              const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
      )),
    );
  }
}
