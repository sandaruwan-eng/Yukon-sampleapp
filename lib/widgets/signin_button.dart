import 'package:flutter/material.dart';
import 'package:sampleapp/constant/widgets_constant.dart';
import 'package:sampleapp/styleguide/text_styles.dart';

// ignore: must_be_immutable
class SignInButton extends StatelessWidget {
  const SignInButton({Key? key, required this.callback}) : super(key: key);

  final VoidCallback callback;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 150 * WidgetsConstant.height),
      child: SizedBox(
        height: 50 * WidgetsConstant.height,
        width: 310 * WidgetsConstant.width,
        child: TextButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: const BorderSide(color: Colors.black)))),
          onPressed: callback,
          child: Text(
            "SIGN IN",
            style: buttonsTextstyle,
          ),
        ),
      ),
    );
  }
}
