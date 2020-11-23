import 'package:crup_api/consts/consts_app.dart';
import 'package:crup_api/pages/decks_pages.dart';
import 'package:crup_api/services/verificar_email.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email, _senha;
  final auth = FirebaseAuth.instance;

  @override
  void initState() {
    //Deixar StatusBar Transparente
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var tamanhoTela = MediaQuery.of(context).size.height;
    var larguraTela = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        width: larguraTela,
        height: tamanhoTela,
        child: Stack(
          children: <Widget>[
            Image.asset(
              ConstsApp.MTGbackground,
              width: larguraTela,
              height: tamanhoTela / 2.45,
              fit: BoxFit.fill,
            ),
            Positioned(
              top: 230,
              child: Container(
                padding: EdgeInsets.all(32),
                width: larguraTela,
                height: tamanhoTela,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Username',
                      ),
                      onChanged: (value) {
                        setState(() {
                          _email = value.trim();
                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 18, bottom: 60),
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Senha',
                        ),
                        onChanged: (value) {
                          setState(() {
                            _senha = value.trim();
                          });
                        },
                      ),
                    ),
                    Container(
                      height: 50,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          color: Colors.greenAccent,
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          )),
                      child: Center(
                        child: Container(
                          height: 50,
                          width: double.maxFinite,
                          child: RaisedButton(
                            onPressed: () {
                              auth.signInWithEmailAndPassword(
                                  email: _email, password: _senha);
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => DecksPage()));
                            },
                            child: Text(
                              'LOGIN',
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Colors.greenAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        'Esqueceu sua senha ?',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: RaisedButton(
                        child: Text(
                          'Cadastre-se',
                          style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline),
                        ),
                        disabledColor: Colors.transparent,
                        onPressed: () {
                          auth
                              .createUserWithEmailAndPassword(
                                  email: _email, password: _senha)
                              .then((_) {
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                              builder: (context) => VerificarEmail(),
                            ));
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
