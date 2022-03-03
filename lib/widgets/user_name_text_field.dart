import 'package:flutter/material.dart';
import 'package:sampleapp/constant/widgets_constant.dart';
import 'package:sampleapp/styleguide/text_styles.dart';

class UserNameTextField extends StatelessWidget {
  const UserNameTextField({Key? key, required this.userNameController})
      : super(key: key);

  final TextEditingController userNameController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Username", style: inputTextFieldTextstyle),
        Padding(
          padding: EdgeInsets.only(bottom: 15.0 * WidgetsConstant.height),
          child: SizedBox(
            width: 300 * WidgetsConstant.width,
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter username';
                }
                return null;
              },
              controller: userNameController,
              autofocus: false,
              keyboardType: TextInputType.text,
            ),
          ),
        ),
      ],
    );
  }
}
