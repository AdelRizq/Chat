import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  final Function _setUserEmail;

  EmailField(this._setUserEmail);

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
            border: InputBorder.none,
            labelText: "Email address",
          ),
          onSaved: (email) {
            _setUserEmail(email);
          },
        ),
      ),
    );
  }
}
