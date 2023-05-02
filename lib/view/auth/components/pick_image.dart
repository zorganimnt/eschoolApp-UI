import 'dart:typed_data';
import 'package:eschoolapp/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:line_icons/line_icons.dart';

class PickPhoto extends StatefulWidget {
  @override
  _PickPhotoState createState() => _PickPhotoState();
}

class _PickPhotoState extends State<PickPhoto> {
  bool _imageAvailable = false;
  late Uint8List _imageBytes;

  Future<void> _getImage() async {
    final pickedFile = await ImagePickerWeb.getImageAsBytes();
    if (pickedFile != null) {
      setState(() {
        _imageBytes = pickedFile;
        _imageAvailable = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: _imageAvailable
          ? InkWell(
              hoverColor: Colors.transparent,
              onTap: _getImage,
              child: CircleAvatar(
                backgroundImage: MemoryImage(_imageBytes),
                radius: 100,
              ),
            )
          : InkWell(
              hoverColor: Colors.transparent,
              onTap: _getImage,
              child: CircleAvatar(
                radius: 100,
                backgroundColor: Colors.black.withOpacity(0.2),
                child: Icon(
                  LineIcons.camera,
                  color: Colors.white,
                ),
              ),
            ),
    );
  }
}
