import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFileComponent extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hint;

  const TextFileComponent({Key? key, required this.textEditingController, this.hint=''}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: hint
      ),
    );
  }
}
