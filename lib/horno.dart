class Horno{
  int _pastes=15;
  bool _valid = true;

  set setPaste(int number) {
    _pastes <= 0?makePastes():_pastes = number;
  }
  set setValid(bool value){
    _valid = value;
  }

  int get getPaste => _pastes;
  bool get getValid => _valid;
  

  makePastes(){
    _pastes = 14;
  }
}

