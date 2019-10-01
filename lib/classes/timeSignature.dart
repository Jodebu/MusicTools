class TimeSignature {
  int _beats;
  int _noteDuration;

  int get beats {
    return _beats;
  }

  int get noteDuration {
    return _noteDuration;
  }

  TimeSignature(int beats, int noteDuration) {
    this._beats = beats;
    this._noteDuration = noteDuration;
  }
}
