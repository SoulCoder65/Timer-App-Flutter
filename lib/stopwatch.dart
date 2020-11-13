import 'package:flutter/material.dart';
import 'dart:async';
class StopWatch extends StatefulWidget {
  @override
  _StopWatchState createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  var stopwatch=Stopwatch();
  final duration=const Duration(seconds: 1);
  bool started=true;
  bool stopped=true;
  bool reset=false;
  String TimeDisplay="00:00:00";
  String FinalTime="";

  //Timer fun run after each sec
  void timerFun()
  {
    Timer(duration,keepRunning);
  }
  //TO update time
  void keepRunning()
  {
    //if stop is false then continue......
    if(stopwatch.isRunning)
      {
        timerFun();
      }
    //Updating time
    setState(() {
      TimeDisplay=stopwatch.elapsed.inHours.toString().padLeft(2,"0")+":"
          +(stopwatch.elapsed.inMinutes%60).toString().padLeft(2,"0")+":"
          +(stopwatch.elapsed.inSeconds%60).toString().padLeft(2,"0");
    });
  }
  //fun call when start press
  void startStopWatch()
  {
    setState(() {
      stopped=false;
      started=false;
    });
    stopwatch.start();
    timerFun();
  }
  //fun call when stop press
  void stopStopWatch()
  {

      setState(() {
        stopped=true;
        reset=true;
        FinalTime=TimeDisplay;
      });
    stopwatch.stop();
  }
  //fun call when restart press
  void resetStopWatch()
  {
    setState(() {
      started=true;
      reset=false;
      TimeDisplay="00:00:00";
      FinalTime="";
    });
    stopwatch.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(TimeDisplay,style: TextStyle(
            fontSize: 60,
            fontWeight: FontWeight.bold,

          ),),
          SizedBox(height: 30,),
          RaisedButton(
              onPressed:started?
                startStopWatch:null,

          child: Text("START"),),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              RaisedButton(onPressed:stopped? null:
                stopStopWatch,
              child: Text("STOP"),),
              RaisedButton(onPressed: reset?resetStopWatch:
                null,
                child: Text("RESTART"),)
            ],
          ),
          Text(FinalTime)
        ],
      ),
    );
  }
}
