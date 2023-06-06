import 'package:flutter/material.dart';

class ShowDialog extends StatelessWidget {
  final Widget? title; 
  final Widget? body; 
  final void Function()? onConfirm; 
  const ShowDialog({super.key, required this.title,  this.body, this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: title,
        content: body,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(15,0,15,10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  child: Text("Annuler", 
                  style: TextStyle(color: Colors.teal, fontWeight: FontWeight.w600),),
                  onPressed: () {
                      Navigator.of(context).pop();
                  } ,
                ),
                TextButton(
                  child: Text("Confirmer", 
                    style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.w600),),
                  onPressed: onConfirm,
                ),
              ],
            ),
          ),
        ],
      );
  }
}