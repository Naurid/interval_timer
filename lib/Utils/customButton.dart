import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget{
  final String buttonLabel;
  final double height;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.buttonLabel,
    required this.onPressed,
    required this.height,
});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: height,
      onPressed: onPressed,
      color: Colors.grey[300],
      child: Text("$buttonLabel"),
    );
  }

}