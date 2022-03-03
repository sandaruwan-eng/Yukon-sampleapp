import 'package:flutter/material.dart';

import 'package:sampleapp/constant/widgets_constant.dart';
import 'package:sampleapp/widgets/signin_button.dart';
import 'package:sampleapp/widgets/dialog_box.dart';
import 'package:sampleapp/widgets/password_text_field.dart';
import 'package:sampleapp/widgets/user_name_text_field.dart';

class SignInMain extends StatefulWidget {
  @override
  _SighInMainState createState() => _SighInMainState();
}

class _SighInMainState extends State<SignInMain>
    with SingleTickerProviderStateMixin {
  TextEditingController userNameController = TextEditingController();
  TextEditingController signPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String userName = "test@test.com";
  String password = "test";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // user name text field
                Padding(
                  padding: EdgeInsets.only(top: 200.0 * WidgetsConstant.width),
                  child: UserNameTextField(
                    userNameController: userNameController,
                  ),
                ),
                // password text field
                PasswordTextField(
                  signPasswordController: signPasswordController,
                ),

                // sign in button
                SignInButton(
                  callback: () {
                    if (_formKey.currentState!.validate()) {
                      if (userNameController.text.trim() == userName &&
                          signPasswordController.text.trim() == password) {
                        Navigator.pushNamed(context, '/home_screen');
                      } else {
                        showMsgDialog(context, "Login faill",
                            "Please enter correct user name or pasword.");
                        return;
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
