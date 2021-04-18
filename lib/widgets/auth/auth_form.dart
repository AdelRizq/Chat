import 'package:chat/widgets/auth/email_field.dart';
import 'package:chat/widgets/auth/username_field.dart';
import 'package:flutter/material.dart';

import './password_field.dart';

class AuthForm extends StatefulWidget {
  const AuthForm(this._submit, this._isLoading);

  final bool _isLoading;
  final void Function(String, String, String, bool, BuildContext) _submit;

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();

  bool _isLogin = false;

  String _userName = '';
  String _userEmail = '';
  String _userPassword = '';

  void _setUserEmail(email) {
    _userEmail = email;
  }

  void _setUserName(username) {
    _userName = username;
  }

  void _setUserPassword(password) {
    _userPassword = password;
  }

  void _trySubmit() {
    final bool isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState.save();
      widget._submit(
        _userEmail.trim(),
        _userName.trim(),
        _userPassword.trim(),
        _isLogin,
        context,
      );
      // send auth request then
      // login and navigate to chat screen
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize:
                  MainAxisSize.min, // TODO: Remove it and try the effect
              children: [
                EmailField(_setUserEmail),
                if (!_isLogin) UserNameField(_setUserName),
                PasswordField(_setUserPassword),
                SizedBox(height: 12),
                if (widget._isLoading) CircularProgressIndicator(),
                if (!widget._isLoading)
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                      ),
                    ),
                    onPressed: _trySubmit,
                    child: Text(_isLogin ? "Login" : "Sign up",
                        style: TextStyle(color: Colors.white)),
                  ),
                if (!widget._isLoading)
                  TextButton(
                    child: Text(_isLogin
                        ? "Create new account"
                        : "I already have an account"),
                    onPressed: () {
                      setState(() => _isLogin = !_isLogin);
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
