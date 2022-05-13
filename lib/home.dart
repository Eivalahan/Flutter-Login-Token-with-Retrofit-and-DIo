import 'package:flutter/material.dart';
import 'package:flutter_api_post_login_token/response_data.dart';
import 'package:flutter_api_post_login_token/task_model.dart';
import 'package:provider/provider.dart';

import 'api_service.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello Retrofit'),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: _futureBuilder(context),
    );
  }

  FutureBuilder _futureBuilder(BuildContext context) {
    TaskModel taskModel = TaskModel(
      name: 'aaa',
      password: 'aaa',
    );

    return FutureBuilder<ResponseData>(
      future: Provider.of<ApiPostService>(context, listen: false)
          .postUserId(taskModel.name, taskModel.password),
      builder: (BuildContext context, AsyncSnapshot<ResponseData> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          ResponseData? responseData = snapshot.data;
          return _getToken(context, responseData!);
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  _getToken(BuildContext context, ResponseData responseData) {
    print(responseData.token.toString() + "Token");
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            responseData.token.toString() + "Token",
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
