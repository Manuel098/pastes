import 'dart:async';
import 'package:flutter/material.dart';
import 'package:new_paste/cliente.dart';
import 'package:new_paste/despachador.dart';
import 'package:new_paste/style.dart';

import 'horno.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pastes Simulator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(title: 'Paste Simulator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _ocuped = false;
  String cl1="",cl2="";
  final Horno horno = Horno();
  final Despachador desp1 = Despachador();
  final Despachador desp2 = Despachador();

  final Client client1 = Client();
  final Client client2 = Client();
  final Client client3 = Client();
  final Client client4 = Client();
  final Client client5 = Client();
  final Client client6 = Client();

  @override
  Scaffold build(BuildContext context) {
    desp1.setName="Manuel";
    desp2.setName="Christian";

    client1.setName="Gerardo";
    client2.setName="Luis";
    client3.setName="Ernesto";
    client4.setName="Danna";
    client5.setName="Jesus";
    client6.setName="Daniel";

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          Row(
            children: <Widget>[
              Card(
                elevation: 12,
                margin: EdgeInsets.all(20),
                child: Container(
                  color: horno.getValid? Colors.green: Colors.red,
                  padding: new EdgeInsets.only(top: 80.0),
                  width: 200,
                  height: 200,
                  child: Text('Horno',textAlign: TextAlign.center, style:TextStyle(
                    color: Colors.white70,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w800,
                    fontSize: 40
                  ),),
                )
              ),
              Text(horno.getPaste.toString(), textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 35,
                  shadows:  <Shadow>[
                    Shadow(
                      offset: Offset(3.0, 3.0),
                      blurRadius: 20,
                      color: Color.fromARGB(205, 0, 0, 0),
                    ),
                  ],
                ),)
            ],
          ),
          Row(
            children: <Widget>[
              Card(
                 color: Colors.transparent,
                elevation: 12,
                margin: EdgeInsets.all(20),
                child: DespStyle().setStyle(desp: desp1),
              ),
              Card(
                color: Colors.transparent,
                elevation: 12,
                margin: EdgeInsets.all(20),
                child: DespStyle().setStyle(desp: desp2),
              ),
            ],
          ),
          Card(
            elevation: 12,
            margin: EdgeInsets.all(20),
            child: Container(
              padding: new EdgeInsets.only(top: 30),
              width: 1000,
              height: 100,
              child: Text(
                "MESA",
                textAlign: TextAlign.center,
                
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30
                ),
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors:[Colors.brown,Colors.brown[400]]
                )
              ),
            )
          ),
          Row(
            children: <Widget>[
              Card(
                  elevation: 12,
                  margin: EdgeInsets.all(20),
                  child: Container(
                    color: Colors.white60,
                    padding: new EdgeInsets.only(top: 45.0),
                    width: 100,
                    height: 100,
                    child: Text(cl1, textAlign: TextAlign.center),
                  )
                ),
                Card(
                  elevation: 12,
                  margin: EdgeInsets.all(20),
                  child: Container(
                    color: Colors.white60,
                    padding: new EdgeInsets.only(top: 45.0),
                    width: 100,
                    height: 100,
                    child: Text(cl2, textAlign: TextAlign.center),
                  )
                ),
            ],
          ),
          
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          worked(cli: client1, time:2);
          worked(cli: client2, time:1);
          worked(cli: client3, time:1);
          worked(cli: client4, time:4);
          worked(cli: client5, time:2);
          worked(cli: client6, time:3);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  worked({Client cli,int time}) async{
    if(!desp1.getOcuped){
      desp1.setOcuped = true;
      cl1 = cli.getName;
      await delayS(desp1, time);
      print('Hola ${cli.getName} le atiende ${desp1.getName} aqui tiene sus ${time.toString()} pastes');
    }else if(!desp2.getOcuped){
      desp2.setOcuped = true;
      cl2 = cli.getName;
      await delayS(desp2, time);
      print('Hola ${cli.getName} le atiende ${desp2.getName} aqui tiene sus ${time.toString()} pastes');
    }if(desp2.getOcuped && desp1.getOcuped || horno.getPaste<=0 ){
      await newDelay(1);
      worked(cli:cli,time:time);
    }
  }

  Future<void> newDelay(int time) => Future.delayed(Duration(seconds: time), () => {
    setState(() {}),
  });

  Future<void> delayS(Despachador desp,int time) => Future.delayed(Duration(seconds: time), () => {
    horno.setPaste=horno.getPaste - time,
    desp.setOcuped = false,
    setState(() {}),
  });
}  

