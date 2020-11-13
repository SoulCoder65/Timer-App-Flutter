//Thank to Desi Programmer Youtube Channel for giving me idea of such app
import 'package:flutter/material.dart';
import 'timer.dart';
import 'stopwatch.dart';


//Main fun
void main()=>runApp(new MaterialApp(
  title: "Timer App",
  theme: ThemeData.dark(),
  home: new TimerApp(),
));

class TimerApp extends StatefulWidget {
  @override
  _TimerAppState createState() => _TimerAppState();
}

class _TimerAppState extends State<TimerApp> {
  @override
  Widget build(BuildContext context) {
    //Using Tab in App bar
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Timer App",style: TextStyle(
           ),),
          centerTitle: true,
          //Tab bar section menu
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.watch_later_outlined),text: "Timer",),
              Tab(icon: Icon(Icons.countertops),text: "Stop Watch",),
            ],
          ),
        ),
        //Tab bar content call two different widgets
        body: TabBarView(
          children: <Widget>[
            TimerClass(),//For Timer App
            StopWatch() //For STop Watch
          ],
        ),
        
      ),
    );
  }
}
