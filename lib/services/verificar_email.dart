import 'dart:async';
import 'package:crup_api/consts/consts_app.dart';
import 'package:crup_api/pages/decks_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VerificarEmail extends StatefulWidget {
  @override
  _VerificarEmailState createState() => _VerificarEmailState();
}

class _VerificarEmailState extends State<VerificarEmail> {
  final auth = FirebaseAuth.instance;
  User user;
  Timer timer;

  @override
  void initState() {
    user = auth.currentUser;
    user.sendEmailVerification();

    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      checarEmailVerificado();
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        color: Colors.blue[400],
        child: Image.asset(
          ConstsApp.VerificarEmail2,
        ),
      ),
    );
  }

  Future<void> checarEmailVerificado() async {
    user = auth.currentUser;
    await user.reload();

    if (user.emailVerified) {
      timer.cancel();
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => DecksPage(),
      ));
    }
  }
}
