import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: "Contador de Pessoas",
      home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _people = 0;
  String _info_text = "Pode entrar!";

  void _change_people(int delta){
    setState(() {
        _people += delta;

        if(_people < 0) {
          _info_text = "Tá doido?";
        }else if(_people > 10) {
          _info_text = "Lotado!";
        }else{
          _info_text = "Pode entrar!";
        }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Image.asset(
        "images/restaurant.jpg",
        fit: BoxFit.cover,
        height: 1000.0,
      ),
      Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        Text("Pessoas: $_people",
            style:
            TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
              padding: EdgeInsets.all(10.0),
              child: FlatButton(
                  child: Text("+1",
                      style: TextStyle(fontSize: 40.0, color: Colors.white)),
                  onPressed: () {
                    _change_people(1);
                  })),
          Padding(
              padding: EdgeInsets.all(10.0),
              child: FlatButton(
                  child: Text("-1",
                      style: TextStyle(fontSize: 40.0, color: Colors.white)),
                  onPressed: () {
                    _change_people(-1);
                  })),
        ]),
        Text(_info_text,
            style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontSize: 30.0))
      ])
    ]);
  }
}




