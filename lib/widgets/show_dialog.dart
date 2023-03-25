import 'package:flutter/material.dart';

class ShowDialog extends StatelessWidget {
  final Widget? title; 
  final Widget? body; 
   
  const ShowDialog({super.key, required this.title,  this.body});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: title,
        content: body,
        actions: <Widget>[
          TextButton(
            child: Text("gg"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text("oi"),
            onPressed: () {
            
              Navigator.of(context).pop();
            },
          ),
        ],
      );
  }
}