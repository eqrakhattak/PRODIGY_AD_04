import 'package:flutter/material.dart';

class DisplayElement extends StatelessWidget {

  final String value;
  const DisplayElement({super.key, required this.value});

  @override
  Widget build(BuildContext context) {

    IconData iconData;
    Color iconColor;

    switch (value){
      case 'X':
        iconData = Icons.close;
        iconColor = const Color(0xFFE61C4F);
        break;
      case 'O':
        iconData = Icons.circle_outlined;
        iconColor = const Color(0xFFFFCE3B);
        break;
      default:
        iconData = Icons.error;
        iconColor = const Color(0xFF0F1131);
    }

    return Icon(
      iconData,
      color: iconColor,
      size: 70,
    );
  }
}
