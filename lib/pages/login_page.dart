import 'package:crup_api/consts/consts_app.dart';
import 'package:crup_api/controllers/login_controller.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
    final loginController = Provider.of<LoginController>(context);
    var tamanhoTela = MediaQuery.of(context).size.height;
    var larguraTela = MediaQuery.of(context).size.width;

    loginController.deslogarConta();

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
                    Observer(
                      builder: (_) {
                        return TextField(
                          decoration: InputDecoration(
                            hintText: 'Username',
                            errorText: loginController.validarUsername(),
                          ),
                          onChanged: loginController.setEmail,
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 18, bottom: 60),
                      child: Observer(builder: (_) {
                        return TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Senha',
                            errorText: loginController.validarSenha(),
                          ),
                          onChanged: loginController.setSenha,
                        );
                      }),
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
                              loginController.validarAcesso();
                              if (loginController.usuarioLogou) {
                                Navigator.pushReplacementNamed(
                                    context, '/home-page');
                              } else {
                                Flushbar(
                                  title: "Deu ruim",
                                  message:
                                      "Seu usuário ou senha estão incorretos",
                                  duration: Duration(seconds: 3),
                                )..show(context);
                              }
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
                        onPressed: () {},
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
