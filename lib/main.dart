
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'api_service.dart';
import '../home2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<ApiPostService>(
      create: (context) => ApiPostService.create(),
      child: MaterialApp(
        theme: ThemeData(
            primaryColor: Colors.blueAccent
        ),
        home: const HomePage(),
      ),
    );
  }
}

