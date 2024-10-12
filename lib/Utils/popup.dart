import 'package:flutter/material.dart';
import 'package:interval_timer/Utils/customButton.dart';

class Popup extends StatelessWidget {
  const Popup({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey[100],
      content: Container(
        height: 200,
        child:Column(
          children: [
            Text("Timers over!"),
            CustomButton(buttonLabel: "Close", onPressed: () {Navigator.pop(context);}, height: 50)
          ]
        )
      ),
    );
  }
}
