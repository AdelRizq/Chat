import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NewMessage extends StatefulWidget {
  @override
  _NewMessageState createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  var _typedMessage = '';
  final _messageController = new TextEditingController();

  void _sendMessage() async {
    FocusScope.of(context).unfocus();
    final user = await FirebaseAuth.instance.currentUser();
    Firestore.instance.collection('chat').add({
      'text': _typedMessage,
      'createdAt': Timestamp.now(),
      'userId': user.uid,
    });
    _messageController.clear();
    _typedMessage = '';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.all(8),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _messageController,
                decoration: InputDecoration(labelText: "Type a message..."),
                onChanged: (value) {
                  setState(() => _typedMessage = value);
                },
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Theme.of(context).canvasColor),
              ),
              child: Icon(Icons.send, color: Theme.of(context).primaryColor),
              onPressed: _typedMessage.trim().isEmpty ? null : _sendMessage,
            ),
          ],
        ));
  }
}
