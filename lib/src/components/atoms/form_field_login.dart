import 'package:flutter/material.dart';

class FormFieldLogin extends StatelessWidget {
  final String hintText;
  final TextEditingController textEditingController;
  final TextInputType keyboardType;
  late final FocusNode? focusNode;
  /*
  const FormFieldLogin({
    Key? key,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.focusNode = FocusNode(),
  }) : super(key: key);
  */
  FormFieldLogin({
    required this.hintText,
    required this.textEditingController,
    this.keyboardType = TextInputType.text,
    FocusNode? focusNode,
  }) {
    this.focusNode = focusNode ?? FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: textEditingController,
        focusNode: focusNode,
        cursorColor: Colors.white,
        decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
          fillColor: Colors.grey[800],
        ),
        keyboardType: keyboardType,
      ),
    );
  }
}
