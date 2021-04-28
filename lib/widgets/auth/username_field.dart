import 'package:flutter/material.dart';

class UserNameField extends StatelessWidget {
  final Function _setUserName;

  UserNameField(this._setUserName);

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
          autocorrect: true,
          enableSuggestions: false,
          textCapitalization: TextCapitalization.words,
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
            border: InputBorder.none,
          ),
          onSaved: (name) {
            _setUserName(name);
          },
        ),
      ),
    );
  }
}
