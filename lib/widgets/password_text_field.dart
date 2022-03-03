import 'package:flutter/material.dart';
import 'package:sampleapp/constant/widgets_constant.dart';
import 'package:sampleapp/styleguide/text_styles.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({Key? key, required this.signPasswordController})
      : super(key: key);

  final TextEditingController signPasswordController;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Password", style: inputTextFieldTextstyle),
        Padding(
          padding: EdgeInsets.only(bottom: 15.0 * WidgetsConstant.height),
          child: SizedBox(
            width: 300 * WidgetsConstant.width,
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter password';
                }
                return null;
              },
              controller: signPasswordController,
              autofocus: false,
              keyboardType: TextInputType.text,
              obscureText: true,
            ),
          ),
        ),
      ],
    );
  }
}
