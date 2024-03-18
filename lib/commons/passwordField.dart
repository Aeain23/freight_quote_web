import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:FreightQuote/constants/style.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController passwordController;
  final Function submitted;

  PasswordField(this.passwordController, this.submitted);
  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _ishidden = true;

  void _toggleVisibility() {
    setState(
      () {
        _ishidden = !_ishidden;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final passwordValidator = MultiValidator([
      RequiredValidator(errorText: 'Password is required'),
      MinLengthValidator(8,
          errorText: 'Password must be at least 8 digits long'),
      PatternValidator(r'(?=.*?[#?!@$%^&*-])',
          errorText: 'Passwords must include special character')
    ]);
    return TextFormField(
      controller: widget.passwordController,
      obscureText: _ishidden ? true : false,
      onFieldSubmitted: (value) => widget.submitted,
      validator: passwordValidator,
      // validator: (value) {
      //   if (value!.isEmpty) {
      //     return "* Required";
      //   } else if (value.length < 6) {
      //     return "Password should be atleast 6 characters";
      //   } else if (value.length > 15) {
      //     return "Password should not be greater than 15 characters";
      //   } else
      //     return null;
      // },

      decoration: InputDecoration(
          hintText: "Password",
          suffixIconConstraints:
              const BoxConstraints(minWidth: 14, minHeight: 14),
          suffixIcon: GestureDetector(
              onTap: _toggleVisibility,
              child: Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Icon(
                    _ishidden ? Icons.visibility_off : Icons.visibility,
                    color: primaryColor,
                  ))),
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none),
    );
  }
}
