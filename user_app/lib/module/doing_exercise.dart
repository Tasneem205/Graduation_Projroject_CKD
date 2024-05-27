import 'package:flutter/material.dart';
import 'dart:async';
import 'package:user_app/module/rest.dart';


class doing_exercise extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Linear Progress Bar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LinearProgressBarPage(),
    );
  }
}

class LinearProgressBarPage extends StatefulWidget {
  @override
  _LinearProgressBarPageState createState() => _LinearProgressBarPageState();
}

class _LinearProgressBarPageState extends State<LinearProgressBarPage> {
  double _progressValue = 0.0;
  bool _progressRunning = true;
  final int _progressDurationSeconds = 30;
  late Timer _timer;
  int _secondsRemaining = 30;

  @override
  void initState() {
    super.initState();
    _startProgress();
  }

  void _startProgress() {
    _timer = Timer.periodic(
      Duration(milliseconds: (_progressDurationSeconds * 1000) ~/ 100),
      (timer) {
        setState(() {
          if (_progressValue < 1.0) {
            _progressValue += 0.01;
            _secondsRemaining = (_progressDurationSeconds * (1 - _progressValue)).ceil();
          } else {
            _progressValue = 1.0;
            _timer.cancel();
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const Rest()));
            
          }
        });
      },
    );
  }

  void _toggleProgress() {
    setState(() {
      _progressRunning = !_progressRunning;
      if (_progressRunning) {
        _startProgress();
      } else {
        _timer.cancel();
        
        
      }
    });
  }

  void _skipToAnotherPage() {
    // Navigate to another page
      Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Rest()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          
              const SizedBox(height: 40),
              Image.asset("assets/img/bridge.png"),
              const SizedBox(height: 30),
              Row(
                children: [
                  Text(
                '$_secondsRemaining ',
                style: const TextStyle(fontSize: 32, color:Color.fromRGBO(12, 138, 125, 1)),
              ),
              const Text("/30",
              style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold)),
                ]
              ),
            
            Container(
              alignment: Alignment.topLeft,
              child:const Text("BRIDGE",style: TextStyle(color:Color.fromRGBO(12, 138, 125, 1) ,fontSize: 26,fontWeight: FontWeight.bold),) ,
            ),
            const SizedBox(height: 30),
        
              SizedBox(
                height: 60,
                child: LinearProgressIndicator(
                  value: _progressValue,
                  backgroundColor: Colors.teal[50],
                  valueColor: const AlwaysStoppedAnimation<Color>(Color.fromRGBO(12, 138, 125, 1)),
                ),
              ),
              
              
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: _toggleProgress,
                    icon: Icon(
                      _progressRunning ? Icons.pause : Icons.play_arrow,
                      color: const Color.fromRGBO(12, 138, 125, 1),
                      size: 48,
                    ),
                  ),
                  const SizedBox(width: 20),
                  IconButton(
                    onPressed: _skipToAnotherPage,
                    icon: const Icon(
                      Icons.navigate_next_rounded,
                      color: Color.fromRGBO(12, 138, 125, 1),
                      size: 48,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
