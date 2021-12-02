import 'package:flutter/material.dart';

class LoginDoneButton extends StatelessWidget {
  final String buttonName;
  final List<TextEditingController> textEditingControllers;
  final Function onPressed;
  const LoginDoneButton({
    required this.buttonName,
    required this.textEditingControllers,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool _enabled = _isButtonEnabled();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        height: 40.0,
        child: ElevatedButton(
          onPressed: _enabled ? () => onPressed() : null,
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 40.0),
          ),
          child: Text(buttonName),
        ),
      ),
    );
  }

  bool _isButtonEnabled() {
    for (TextEditingController x in textEditingControllers) {
      if (x.text == "") {
        //return false
        return true;
      }
    }
    return true;
  }
}
