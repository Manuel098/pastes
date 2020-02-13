import 'package:flutter/material.dart';
import 'runProyect.dart';

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
                margin: EdgeInsets.all(25),
                child: Container(
                  width: 200,
                  height: 200,
                  child: Text('data'),
                )
              ),
              Text('data',style: TextStyle(
                fontSize: 35,
                shadows:  <Shadow>[
                  Shadow(
                    offset: Offset(3.0, 3.0),
                    blurRadius: 25,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ],
              ),)
            ],
          ),
          Row(
            children: <Widget>[
              Card(
                  elevation: 12,
                  margin: EdgeInsets.all(25),
                  child: Container(
                    width: 100,
                    height: 100,
                    child: Text('data'),
                  )
                ),
                Card(
                  elevation: 12,
                  margin: EdgeInsets.all(25),
                  child: Container(
                    width: 100,
                    height: 100,
                    child: Text('data'),
                  )
                ),
            ],
          ),
          Card(
            elevation: 12,
            margin: EdgeInsets.all(25),
            child: Container(
              width: 1000,
              height: 100,
              child: Text('data'),
            )
          ),
          
        ],
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed: ,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
