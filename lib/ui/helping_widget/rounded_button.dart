import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final VoidCallback onPress;
  final String text;
  final Color color;
  final Color textColor;
  const RoundButton(
      {Key? key,
      required this.onPress,
      required this.color,
      required this.text,
      this.textColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 10,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      onPressed: onPress,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: color,
      child: Text(
        text,
        style: TextStyle(
            fontSize: 18, color: textColor, fontWeight: FontWeight.bold),
      ),
    );
  }
}
