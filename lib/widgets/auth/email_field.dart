import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  final Function _setUserEmail;

  EmailField(this._setUserEmail);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: ValueKey("email"),
      validator: (email) {
        if (email.isEmpty) return "Please enter an email";

        const regex =
            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$";
        if (!RegExp(regex).hasMatch(email)) {
          return "Invalid email";
        }

        return null;
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Email address",
      ),
      onSaved: (email) {
        _setUserEmail(email);
      },
    );
  }
}
