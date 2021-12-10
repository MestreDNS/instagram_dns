import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:instagram/src/components/atoms/form_field_login.dart';
import 'package:instagram/src/components/atoms/instagram_logo.dart';
import 'package:instagram/src/components/atoms/login_done_button.dart';
import 'package:instagram/src/objects/user_login.dart';
import 'package:instagram/src/pages/home_page.dart';
import 'package:instagram/src/theme/colors.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

final TextEditingController userTextEditingController = TextEditingController();
final TextEditingController passTextEditingController = TextEditingController();

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyThemeColors.primary,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const InstagramLogo(),
                FormFieldLogin(
                  hintText: "Número de telefone, email ou nome de usuário",
                  textEditingController: userTextEditingController,
                ),
                FormFieldLogin(
                  hintText: "Senha",
                  textEditingController: passTextEditingController,
                ),
                LoginDoneButton(
                  buttonName: "Entrar",
                  onPressed: () => _donePressed(),
                  textEditingControllers: [
                    userTextEditingController,
                    passTextEditingController,
                  ],
                ),
                _getLoginHelper(SignInVars._loginHelperSpan),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getLoginHelper(List<TextSpan> _spanList) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Center(
        child: RichText(
          text: TextSpan(children: _spanList),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  void _donePressed() async {
    final String? newUser = await UserLoginObject.checkLogin(
      userTextEditingController.text,
      passTextEditingController.text,
    );
    if (newUser != null) {
      _loginSuccessfull(newUser);
    }
  }

  _loginSuccessfull(String _newUser) {
    Navigator.pushNamed(context, '/home');
  }
}

class SignInVars {
  static const List<TextSpan> _loginHelperSpan = [
    TextSpan(
      text: "Esqueceu seus dados de login?",
      style: TextStyle(color: Colors.grey, fontSize: 12),
    ),
    TextSpan(
      text: " Obtenha ajuda para entrar.",
      style: TextStyle(
        color: Colors.white,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
    ),
  ];
}
