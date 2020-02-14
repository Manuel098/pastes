class Despachador{
  String _name;
  bool _ocuped = false;

  set setName(String value){
    _name = value;
  }

  set setOcuped(bool value){
    _ocuped = value;
  }

  String get getName => _name;
  bool get getOcuped => _ocuped;
}