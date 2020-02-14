import 'package:flutter/material.dart';
import 'package:new_paste/despachador.dart';

class DespStyle{
  Container setStyle({Despachador desp}) =>Container(
    padding: new EdgeInsets.only(top: 45.0),
    width: 100,
    height: 100,
    
    child: Text(desp.getName, textAlign: TextAlign.center,style: TextStyle(
      color: Colors.white70,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.w800,
      fontSize: 20
    ),),
    decoration: BoxDecoration(
      color: desp.getOcuped?Colors.red: Colors.green,
      borderRadius: BorderRadius.circular(50)
    ),
  );
}