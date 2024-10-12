import 'dart:async';

import 'package:flutter/material.dart';
import 'package:interval_timer/Utils/alertBox.dart';
import 'package:interval_timer/Utils/customButton.dart';
import 'package:interval_timer/Utils/popup.dart';
import 'package:interval_timer/Utils/timerCustom.dart';

class HomePage extends StatefulWidget {
  const HomePage();

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {

  final _hoursController = TextEditingController();
  final _minutesController = TextEditingController();
  final _secondsController = TextEditingController();

  Timer? _timer;

  int currentIndex = 0;

  List timers = [
    [00,00,45],
    [00,00,15],
  ];

  String currentTimerDisplay = "00:00:00";

  void showAlert(){
    _hoursController.text ="";
    _minutesController.text ="";
    _secondsController.text ="";
    showDialog(
      context: context,
      builder: (context){
      return DialogBox(
        hoursController: _hoursController,
        minutesController: _minutesController,
        secondsController: _secondsController,
        onPressed: (){saveTimer();},);
    });
  }

  void saveTimer(){
    int hours = _hoursController.text.isNotEmpty ? int.parse(_hoursController.text) : 0;
    int minutes = _minutesController.text.isNotEmpty ? int.parse(_minutesController.text) : 0;
    int seconds = _secondsController.text.isNotEmpty ? int.parse(_secondsController.text) : 0;

    if(hours == 0 && minutes == 0 && seconds == 0){
      Navigator.pop(context);
      return;
    }

    setState(() {
      timers.add([hours, minutes, seconds]);
      Navigator.pop(context);
    });
  }

  void startTimers(){
    currentIndex = 0;
    const duration = Duration(seconds: 1);
    int remainingSeconds = timers[currentIndex][2];
    int remainingMinutes = timers[currentIndex][1];
    int remainingHours = timers[currentIndex][0];


    _timer = Timer.periodic(duration, (Timer timer) {
      if(remainingSeconds == 0){
        if(remainingMinutes == 0){
          if(remainingHours == 0){
            startNextTimer();
          }
          else{
            remainingHours--;
          }
        }
        else{
          remainingMinutes--;
        }
      }
      else{
        remainingSeconds--;
      }
      setState(() {
        currentTimerDisplay = "${remainingHours >= 10 ? remainingHours.toString() : "0" + remainingHours.toString()}"
            " : "
            "${remainingMinutes >= 10 ? remainingMinutes.toString() : "0" + remainingMinutes.toString()}"
            " : "
            "${remainingSeconds >= 10 ? remainingSeconds.toString() : "0" + remainingSeconds.toString()}";
      });
    });
  }

  void startNextTimer(){
    if(currentIndex == timers.length) {
      _timer?.cancel();
      showDialog(context: context, builder: (context) {
        return Popup();
      });
      return;
    }

    currentIndex++;

    const duration = Duration(seconds: 1);
    int remainingSeconds = timers[currentIndex][2];
    int remainingMinutes = timers[currentIndex][1];
    int remainingHours = timers[currentIndex][0];


    _timer = Timer.periodic(duration, (Timer timer) {
      if(remainingSeconds == 0){
        if(remainingMinutes == 0){
          if(remainingHours == 0){
            startNextTimer();
          }
          else{
            remainingHours--;
          }
        }
        else{
          remainingMinutes--;
        }
      }
      else{
        remainingSeconds--;
      }
      setState(() {
        currentTimerDisplay = "${remainingHours >= 10 ? remainingHours.toString() : "0" + remainingHours.toString()}"
            " : "
            "${remainingMinutes >= 10 ? remainingMinutes.toString() : "0" + remainingMinutes.toString()}"
            " : "
            "${remainingSeconds >= 10 ? remainingSeconds.toString() : "0" + remainingSeconds.toString()}";
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Center(
            child: Text("Timer",
            style: TextStyle(color: Colors.white),)
        ),
        backgroundColor: Colors.black,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: showAlert,
          backgroundColor: Colors.grey[300],
          child: Icon(Icons.add),),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(25),
            child: Container(
              padding: EdgeInsets.all(25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.black54
              ),
              child: Text(currentTimerDisplay,
              style: TextStyle(
                fontSize: 70,
                color: Colors.white
              ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: timers.length,
              itemBuilder: (context, index){
                return CustomTimer(
                    seconds: timers[index][2],
                    minutes: timers[index][1],
                    hours: timers[index][0],
                    timerIndex: index + 1);
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(25),
            child: Expanded(
              flex: -1,
                child: CustomButton(height: 50, buttonLabel: "Start Timer", onPressed: startTimers)),
          )
        ],
      )

    );
  }
}
