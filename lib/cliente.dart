class Client{
  String _name;
  bool _active = false;

  set setName(String value){
    _name = value;
  }

  set setActive(bool value){
    _active = value;
  }

  String get getName => _name;
  bool get getActive => _active;
}