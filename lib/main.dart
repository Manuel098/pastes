import 'dart:async';
import 'package:flutter/material.dart';

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
  final horno = Horno();

  @override
  Scaffold build(BuildContext context) {
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
                  padding: new EdgeInsets.only(top: 100.0),
                  width: 200,
                  height: 200,
                  child: Text('Horno',textAlign: TextAlign.center,),
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
                  elevation: 12,
                  margin: EdgeInsets.all(20),
                  child: Container(
                    padding: new EdgeInsets.only(top: 45.0),
                    width: 100,
                    height: 100,
                    child: Text('Despachador', textAlign: TextAlign.center),
                  )
                ),
                Card(
                  elevation: 12,
                  margin: EdgeInsets.all(20),
                  child: Container(
                    padding: new EdgeInsets.only(top: 45.0),
                    width: 100,
                    height: 100,
                    child: Text('Despachador', textAlign: TextAlign.center),
                  )
                ),
            ],
          ),
          Card(
            elevation: 12,
            margin: EdgeInsets.all(20),
            child: Container(
              padding: new EdgeInsets.only(top: 45.0),
              width: 1000,
              height: 100,
              child: Text('data',textAlign: TextAlign.center),
            )
          ),
          Row(
            children: <Widget>[
              Card(
                  elevation: 12,
                  margin: EdgeInsets.all(20),
                  child: Container(
                    padding: new EdgeInsets.only(top: 45.0),
                    width: 100,
                    height: 100,
                    child: Text('Cliente', textAlign: TextAlign.center),
                  )
                ),
                Card(
                  elevation: 12,
                  margin: EdgeInsets.all(20),
                  child: Container(
                    padding: new EdgeInsets.only(top: 45.0),
                    width: 100,
                    height: 100,
                    child: Text('Cliente', textAlign: TextAlign.center),
                  )
                ),
            ],
          ),
          
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          if(horno.getPaste == 0 && horno.getValid){
            horno.setValid = false;
            print('valid');
            Timer.periodic(Duration(seconds: 5), (timer) {
              horno.setPaste = horno.getPaste - 1;
              horno.setValid = true;
            });
          }else if( horno.getValid ){
            horno.setPaste= horno.getPaste - 1;
          }
          setState(() {});
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

