import 'package:flutter/material.dart';

class CustomTimer extends StatelessWidget {
  final int seconds;
  final int minutes;
  final int hours;
  final int timerIndex;

  CustomTimer(
      {super.key,
      required this.seconds,
      required this.minutes,
      required this.hours,
      required this.timerIndex});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(25),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(12),
             boxShadow: [BoxShadow(
              color: Colors.black26,
               spreadRadius: 5,
               blurRadius: 7
            )],
          ),
          padding: EdgeInsets.all(24),
          child: Center(
              child: Row(
            children: [
              Text(
                "${timerIndex}",
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              SizedBox(width: 150),
              Text(
                  "${hours >= 10 ? hours.toString() : "0" + hours.toString()}"
                  " : "
                  "${minutes >= 10 ? minutes.toString() : "0" + minutes.toString()}"
                  " : "
                  "${seconds >= 10 ? seconds.toString() : "0" + seconds.toString()}",
                  style: TextStyle(fontSize: 24, color: Colors.white)),
            ],
          )),
        ));
  }
}
