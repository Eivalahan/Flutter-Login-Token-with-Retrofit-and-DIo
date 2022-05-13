import 'package:flutter/material.dart';

class FormPage extends StatelessWidget {
  var accessToken;

  FormPage({Key? key, required this.accessToken}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text( "Fill The Form"),
        ),
        body: Column(
          children: [
            Text(accessToken),
          ],
        ),
      ),
    );
  }
}
