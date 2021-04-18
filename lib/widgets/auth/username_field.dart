import 'package:flutter/material.dart';

class UserNameField extends StatelessWidget {
  final Function _setUserName;

  UserNameField(this._setUserName);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: ValueKey("username"),
      validator: (username) {
        if (username.isEmpty) return "Please enter a username";

        if (username.length < 3) {
          return "Must be 3 characters at least";
        }

        return null;
      },
      decoration: InputDecoration(
        labelText: "Username",
      ),
      onSaved: (name) {
        _setUserName(name);
      },
    );
  }
}
