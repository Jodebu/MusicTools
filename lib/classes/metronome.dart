import 'dart:async';

import 'package:audioplayers/audio_cache.dart';
import 'package:musictools/classes/timeSignature.dart';

class Metronome {
  TimeSignature _timeSignature;
  int _speedReference;
  int _speed;

  Metronome();

  TimeSignature get timeSignature {
    return _timeSignature;
  }

  set timeSignature(TimeSignature timeSignature) {
    this._timeSignature = timeSignature;
  }

  int get speedReference {
    return _speedReference;
  }

  set speedReference(int speedReference) {
    this._speedReference = speedReference;
  }

  int get speed {
    return _speed;
  }

  set speed(int speed) {
    this._speed = speed;
  }

  void play() {
    //TODO: calcular velocidad
    // int bpm = ((1 / _speedReference * _timeSignature.noteDuration) * _speed) as int;
    // int beatInterval = (Duration.microsecondsPerMinute / (((1 / _speedReference) * _timeSignature.noteDuration) * _speed)).round();
    int beatInterval = ((Duration.microsecondsPerMinute * _speedReference) /
            (_timeSignature.noteDuration * _speed))
        .round();

    AudioCache metronomeTick = AudioCache(prefix: 'audio/metronome/');
    AudioCache metronomeBeat = AudioCache(prefix: 'audio/metronome/');
    metronomeTick.load('MetroBar1.wav');
    metronomeBeat.load('MetroBeat1.wav');

    metronomeTick.play('MetroBar1.wav');
    Timer.periodic(Duration(microseconds: beatInterval * _timeSignature.beats),
        (timer) {
      metronomeTick.play('MetroBar1.wav');
    });

    Timer.periodic(Duration(microseconds: beatInterval), (timer) {
      final double volume = timer.tick % _timeSignature.beats == 0 ? 0 : 0.5;
      metronomeBeat.play('MetroBeat1.wav', volume: volume);
    });
  }
}
