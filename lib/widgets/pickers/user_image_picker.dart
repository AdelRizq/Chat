import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  Function _setUserImage;
  File _userImage;

  UserImagePicker(this._userImage, this._setUserImage);

  @override
  _UserImagePickerState createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File _pickedImage;

  void _pickImage(source) async {
    final pickedImage = await ImagePicker().getImage(
      source: source,
      imageQuality: 50,
      maxWidth: 150,
    );

    setState(() {
      if (pickedImage != null) {
        _pickedImage = File(pickedImage.path);
        widget._setUserImage(_pickedImage);
      } else {
        print('No image selected.');
      }
    });
  }

  void _choosePicker() {
    showDialog(
      context: context,
      builder: (BuildContext context) => SimpleDialog(
        title: const Text('Select picker'),
        children: [
          SimpleDialogOption(
            onPressed: () {
              Navigator.of(context).pop();
              _pickImage(ImageSource.camera);
            },
            child: Row(
              children: [
                const Icon(Icons.camera_alt),
                const Text('Camera'),
              ],
            ),
          ),
          SimpleDialogOption(
            onPressed: () {
              Navigator.of(context).pop();
              _pickImage(ImageSource.gallery);
            },
            child: Row(
              children: [
                const Icon(Icons.image),
                const SizedBox(width: 5),
                const Text('Gallery'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: _pickedImage != null
                  ? FileImage(_pickedImage)
                  : widget._userImage != null
                      ? FileImage(widget._userImage)
                      : null,
            ),
          ],
        ),
        TextButton.icon(
          onPressed: _choosePicker,
          icon: Icon(Icons.camera_alt_outlined),
          label: Text("Pick Image"),
        ),
      ],
    );
  }
}
