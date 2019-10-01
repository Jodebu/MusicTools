abstract class Note {
  int _duration;
  var _picto;

  int get duration {
    return _duration;
  }

  int get picto {
    return _picto;
  }

  Note(duration, {picto = 'none'}) {
    this._duration = duration;
    this._picto = picto;
  }
}

class Whole extends Note {
  Whole() : super(1);
}

class Half extends Note {
  Half() : super(2);
}

class Quarter extends Note {
  Quarter() : super(4);
}
