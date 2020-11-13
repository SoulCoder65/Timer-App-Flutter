import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'main.dart';
import 'dart:async';
import 'dart:ui';

class TimerClass extends StatefulWidget {
  @override
  _TimerClassState createState() => _TimerClassState();
}

class _TimerClassState extends State<TimerClass> {
  //Initializing variables
  int hour=0;
  int min=0;
  int sec=0;
  String currentTimer="";
  //To enable disable btns use bool variables
  bool started=true;
  bool stopped=true;
  bool cancelTimer=false;
  int timefortimer;

  //Fun call when user start timer
  void startTimer()
  {
    setState(() {
      started=false;
      stopped=false;
      cancelTimer=false;
    });
    //Converting entire time in secos
    timefortimer=((hour*3600)+(min*60)+(sec));
    //Updating time after every seconds
    Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        if(timefortimer<1 || cancelTimer)
        {
          t.cancel();
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TimerApp()));
        //  If user stop then re-render time page
        }
        //only seconds
        else if(timefortimer<60) {
          currentTimer=timefortimer.toString();
          timefortimer-=1;
        }
        //seconds+minutes
        else if(timefortimer<3600)
          {
            int m=timefortimer~/60;
            int s=timefortimer-(60*m);
            currentTimer=m.toString()+ ":"+s.toString();
            timefortimer-=1;
          }
        //Seconds+minutes+hour
        else{
          int h=timefortimer~/3600;
          int t=timefortimer -(3600*h);
          int m=t ~/60;
          int s=t-(60*m);
          currentTimer=h.toString()+":"+m.toString()+":"+s.toString();
          timefortimer-=1;

        }
      });
    });
  }
  //Function call on stop press
  void stopTimer()
  {
    stopped=true;
    started=true;
    cancelTimer=true;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  child:Padding(
                    padding: const EdgeInsets.all(2),
                    child: new Column(
                      children: [
                        //Using number picker for time selection
                        NumberPicker.integer(
                            initialValue: 0,
                            minValue: 0,
                            maxValue: 24,

                            onChanged: (value) =>
                                setState(()=>hour=value)
                        ),
                        SizedBox(height: 20),
                        Text(hour.toString(),style: TextStyle(
                          color: Colors.teal,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),)
                      ],
                    ),
                  )

              ),
              //For Minutes
              Container(
                width: 40,
                  child:Padding(
                    padding: const EdgeInsets.all(2),
                    child: new Column(
                      children: [
                        NumberPicker.integer(
                            initialValue: 0,
                            minValue: 0,
                            maxValue: 60,
                            onChanged: (value) =>
                                setState(()=>min=value)
                        ),
                        SizedBox(height: 20),
                        Text(min.toString(),style: TextStyle(
                          color: Colors.teal,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),)
                      ],
                    ),
                  )

              ),
              //For Sec
              Container(
                  child:Padding(
                    padding: const EdgeInsets.all(2),
                    child: new Column(
                      children: [
                        NumberPicker.integer(
                            initialValue: 0,
                            minValue: 0,
                            maxValue: 60,
                            onChanged: (value) =>
                                setState(()=>sec=value)
                        ),
                        SizedBox(height: 20),
                        Text(sec.toString(),style: TextStyle(
                          color: Colors.teal,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),)
                      ],
                    ),
                  )

              ),
              //Button

            ],
          ),
          SizedBox(height: 50,),
          Center(
            child: Text(currentTimer,style: TextStyle(
              fontSize: 30,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              color: Colors.lightBlue
            ),
            ),
          ),
          SizedBox(height: 50,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RaisedButton(onPressed:started?startTimer:null
                    , child: Text("START"),elevation: 10,
              splashColor: Colors.blueGrey,color: Colors.teal,),
              RaisedButton(onPressed:stopped?null:stopTimer
               , child: Text("STOP"),elevation: 10,color: Colors.teal,splashColor: Colors.blueGrey,)
            ],
          )
        ],

      ),

    );
  }
}
