
// ignore: must_be_immutable
import 'package:flutter/material.dart';

class BuildPageIntro extends StatelessWidget {
  BuildPageIntro(
      {Key? key,
      required this.imageDirec,
      required this.title,
      required this.discription})
      : super(key: key);
  final String imageDirec;
  final String title;
  final String discription;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
       Image.asset(imageDirec, width: 270,),
        Padding(
          padding: const EdgeInsets.fromLTRB(50, 20, 50, 10),
          child: Column(
            children: [
              Text(title, 
              style: TextStyle(
                fontSize: 20, 
                fontWeight: FontWeight.w600, 
                color: Colors.black87
              ),),
              SizedBox(height: 10,), 
              Text(discription, 
              style: TextStyle(
                fontWeight: FontWeight.w500, 
                fontSize: 13, 
                color: Colors.black54
              ),)
            ],
          ),
        ),
      ],
    );
  }

  Color colorTitle = const Color.fromARGB(255, 43, 43, 43);
  Color colorDisc = const Color.fromARGB(255, 91, 91, 91);
}
