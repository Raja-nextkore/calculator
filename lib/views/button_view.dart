import 'package:flutter/material.dart';

class BuildButtons extends StatelessWidget {
  final Color? color;
  final Color? textColor;
  final String? buttonText;
  final VoidCallback onTaped;
  const BuildButtons(
      {Key? key,
      required this.color,
      required this.textColor,
      required this.buttonText,required this.onTaped,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:()=> onTaped(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            color: color,
            child: Center(
              child: Text(
                buttonText!,
                style: TextStyle(
                  color: textColor,
                  //fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
