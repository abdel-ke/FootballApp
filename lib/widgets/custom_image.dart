import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({super.key, required this.logo, required this.name});
  final String logo;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.network(
            logo,
            width: 80,
          ),
        ),
        FittedBox(
            child: Text(name,
                style: const TextStyle(fontWeight: FontWeight.w500))),
      ],
    );
  }
}
