import 'package:contactapp/android/views/home.view.dart';
import 'package:contactapp/controllers/auth.controller.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final controller = new AuthController();

  @override
  void initState() {
    super.initState();
    controller.authenticate().then((result) {
      if (result) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => HomeView(),
          ),
        );
      } else {
        // a fazer
      }
    }).catchError((error) {
      print(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.fingerprint,
              size: 92,
              color: Theme.of(context).accentColor,
            ),
            SizedBox(height: 20),
            Text(
              "Meus Contatos",
              style: TextStyle(
                fontSize: 24,
                color: Theme.of(context).accentColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
