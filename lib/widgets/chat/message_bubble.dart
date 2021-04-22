import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  MessageBubble(this._message, this._isCurrentUser, {this.key});
  final String _message;
  final bool _isCurrentUser;
  final key;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          _isCurrentUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
              bottomLeft:
                  _isCurrentUser ? Radius.circular(12) : Radius.circular(0),
              bottomRight:
                  _isCurrentUser ? Radius.circular(0) : Radius.circular(12),
            ),
            color: _isCurrentUser ? Colors.grey[400] : Colors.indigo,
          ),
          width: 180,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 18),
          margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Text(
            _message,
            style: TextStyle(
              // color: Theme.of(context).accentTextTheme.headline1.color,),
              color: _isCurrentUser ? Colors.white : Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
