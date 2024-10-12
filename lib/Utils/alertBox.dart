import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:interval_timer/Utils/customButton.dart';

class DialogBox extends StatelessWidget {
  final hoursController;
  final minutesController;
  final secondsController;
  final VoidCallback onPressed;

  DialogBox({
    super.key,
    required this.hoursController,
    required this.minutesController,
    required this.secondsController,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey[100],
      content: Container(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //hours
              Expanded(
                child: TextField(
                  controller: hoursController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(2)
                  ],
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: "00",
                  ),
                ),
              ),
              Text(" : "),
              //minutes
              Expanded(
                child: TextField(
                  controller: minutesController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(2)
                  ],
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: "00",
                  ),
                ),
              ),
              Text(" : "),
              //seconds
              Expanded(
                child: TextField(
                  controller: secondsController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(2)
                  ],
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: "00",
                  ),
                ),
              ),
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomButton(height: 50, buttonLabel: "Save", onPressed: onPressed),
                const SizedBox(width: 15),
                CustomButton(
                  height: 50,
                    buttonLabel: "Cancel",
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ],
            ),
          ],
        ),
      ),
    );
  }
}
