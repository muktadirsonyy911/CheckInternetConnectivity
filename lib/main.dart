import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Connection(),
    );
  }
}

class Connection extends StatefulWidget {
  @override
  _ConnectionState createState() => _ConnectionState();
}

class _ConnectionState extends State<Connection> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Check Internet Connectivity"),
        centerTitle: true,
      ),
      body: Center(
        child: RaisedButton(onPressed: () {
          _check();
        }),
      ),
    ));
  }

  _check() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      _showDialog(
        "No Internet",
        "You are not connect to a network"
      );
    } else if (result == ConnectivityResult.mobile) {
      _showDialog(
          "Internet Access",
          "You are not connect to your mobile Network"
      );
    } else if (result == ConnectivityResult.wifi) {
      _showDialog(
          "Internet Access",
          "You are not connect to WIFI network"
      );
    }
  }

  _showDialog(title, text) {
    showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: Text(text),
        actions: [
          FlatButton(onPressed: (){
            Navigator.of(context).pop();
          }, child: Text("OK"))
        ],

      );
    });
  }
}
