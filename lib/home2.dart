
import 'package:flutter/material.dart';
import 'package:flutter_api_post_login_token/form_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'api_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myNameController = TextEditingController();
  final _myPasswordController = TextEditingController();
  var saveToken = "";
  final bool _validate = false;



  @override
  void dispose() {
    _myNameController.dispose();
    _myPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Retrieve Data of User'),
        ),
        body: Column(
          children: [
            TextField(
              controller: _myNameController,
              decoration: InputDecoration(
                labelText: 'Enter the Name',
                errorText: _validate ? 'N Can\'t Be Empty' : null,
              ),
            ),
            TextField(
              controller: _myPasswordController,
              decoration: InputDecoration(
                labelText: 'Enter the Password',
                errorText: _validate ? 'Password Can\'t Be Empty' : null,
              ),
            ),
            FloatingActionButton(
              onPressed: () async {
                if (_myNameController.text.isEmpty) {
                  const snackBar = SnackBar(
                    content: Text("Enter The Name"),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } else if (_myPasswordController.text.isEmpty) {
                  const snackBar = SnackBar(
                    content: Text("Enter The Password"),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } else {
                  await _getToken(
                      _myNameController.text, _myPasswordController.text);
                }

                setState(() {});
              },
            ),
          ],
        ));
  }

  _getToken(String name, String password) async {
    final responseData =
        await Provider.of<ApiPostService>(context, listen: false)
            .postUserId(name, password);
    String accessToken = responseData.token.toString();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(
      () {
        prefs.setString("AccessToken", accessToken);
        print(prefs.getString("AccessToken"));
        String? prefsKey = prefs.getString("Key");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => FormPage(accessToken: prefsKey!),
          ),
        );
      },
    );
  }
}
