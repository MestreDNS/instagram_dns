import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:instagram/src/components/atoms/form_field_login.dart';
import 'package:instagram/src/components/atoms/login_done_button.dart';
import 'package:instagram/src/objects/user_login.dart';
import 'package:instagram/src/theme/colors.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool selectedIsPhone = true;
  final FocusNode _focusNode = FocusNode();
  final TextEditingController signUpTextEditingController =
      TextEditingController();

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
                const Icon(
                  Icons.person_pin,
                  size: 144,
                ),
                SizedBox(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _focusNode.unfocus();
                                  selectedIsPhone = true;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                              ),
                              child: Text(
                                "TELEFONE",
                                style: TextStyle(
                                  color: selectedIsPhone
                                      ? Colors.white
                                      : Colors.grey[800],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: selectedIsPhone ? 3.0 : 2.0,
                              child: Container(
                                color: selectedIsPhone
                                    ? Colors.white
                                    : Colors.grey[800],
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _focusNode.unfocus();
                                  selectedIsPhone = false;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                              ),
                              child: Text(
                                "EMAIL",
                                style: TextStyle(
                                  color: !selectedIsPhone
                                      ? Colors.white
                                      : Colors.grey[800],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: !selectedIsPhone ? 3.0 : 2.0,
                              child: Container(
                                color: !selectedIsPhone
                                    ? Colors.white
                                    : Colors.grey[800],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                FormFieldLogin(
                  hintText: selectedIsPhone ? "Telefone" : "Email",
                  keyboardType: selectedIsPhone
                      ? TextInputType.phone
                      : TextInputType.emailAddress,
                  focusNode: _focusNode,
                  textEditingController: signUpTextEditingController,
                ),
                _getSelectedHelper(),
                LoginDoneButton(
                  buttonName: "Avançar",
                  onPressed: () {},
                  textEditingControllers: [signUpTextEditingController],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getSelectedHelper() {
    final String _text = selectedIsPhone
        ? "Você pode receber atualizações por SMS do Instagram e pode cancelar o recebimento a qualquer momento."
        : "";
    return Padding(
      padding: EdgeInsets.symmetric(vertical: selectedIsPhone ? 8.0 : 0),
      child: Center(
        child: Text(
          _text,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.grey, fontSize: 12),
        ),
      ),
    );
  }
}
