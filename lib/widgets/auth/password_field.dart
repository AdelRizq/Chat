import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  final Function _setUserPassword;

  PasswordField(this._setUserPassword);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorLight,
        borderRadius: new BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: TextFormField(
          key: ValueKey("password"),
          validator: (password) {
            if (password.isEmpty) return "Please enter a password";

            final regex = r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$";
            if (!RegExp(regex).hasMatch(password)) {
              if (password.length < 8) return "Must be 8 characters at least";
              return "Must contain at least one letter and one number";
            }

            return null;
          },
          decoration: InputDecoration(
            labelText: "Password",
            border: InputBorder.none,
          ),
          onSaved: (password) {
            _setUserPassword(password);
          },
          obscureText: true,
        ),
      ),
    );
  }
}
