import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  @observable
  String _email = '';
  @action
  setEmail(String email) => _email = email;

  @observable
  String _senha = '';
  @action
  setSenha(String senha) => _senha = senha;

  @computed
  String get email => _email;
  @computed
  String get senha => _senha;

  String validarUsername() {
    if (_email == null || _email.isEmpty) {
      return "este campo é obrigatório";
    } else if (!_email.contains('@')) {
      return "este email não é válido";
    } else {
      return null;
    }
  }

  String validarSenha() {
    if (_senha == null || _senha.isEmpty) {
      return "este campo é obrigatório";
    }

    return null;
  }

  Future<String> validarAcesso(String username, String senha) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: username, password: senha);

      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        return 'Usuário não encontrado';
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        return 'Senha inválida';
      }
    }

    return null;
  }
}
