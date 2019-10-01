import 'package:flutter/material.dart';
import 'package:musictools/classes/metronome.dart';
import 'package:musictools/classes/timeSignature.dart';

class MetronomeScreen extends StatefulWidget {
  MetronomeScreen({Key key}) : super(key: key);

  final String title = 'Metronome';

  @override
  _MetronomeScreenState createState() => _MetronomeScreenState();
}

class _MetronomeScreenState extends State<MetronomeScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    Metronome metronome = Metronome();
    metronome.timeSignature = TimeSignature(6, 8);
    metronome.speed = 120;
    metronome.speedReference = 4;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => metronome.play(),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
