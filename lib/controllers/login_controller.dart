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

  @observable
  User _user;
  @action
  setUser(User user) => _user = user;

  @computed
  String get email => _email;
  @computed
  String get senha => _senha;
  @computed
  bool get usuarioLogou => _user != null ? true : false;

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

  Future<String> validarAcesso() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: _email, password: _senha);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'Usuário não encontrado';
      } else if (e.code == 'wrong-password') {
        return 'Senha inválida';
      }
    }
    setUser(FirebaseAuth.instance.currentUser);
    return null;
  }

  deslogarConta() {
    try {
      FirebaseAuth.instance.signOut();
    } catch (e) {}
  }
}
