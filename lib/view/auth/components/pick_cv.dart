import 'dart:typed_data';
import 'package:eschoolapp/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

class PickCV extends StatefulWidget {
  @override
  _PickCVState createState() => _PickCVState();
}

class _PickCVState extends State<PickCV> {
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
              child: Container(
                height: 100,
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(image: MemoryImage(_imageBytes))),
              ),
            )
          : InkWell(
              hoverColor: Colors.transparent,
              onTap: _getImage,
              child: Container(
                height: 100,
                child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(LineIcons.fileUpload),
                    SizedBox(
                      width: 5,
                    ),
                    Text('Ajouter CV'),
                  ],
                )),
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
    );
  }
}
