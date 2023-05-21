import 'package:eschoolapp/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class GuideWidget extends StatelessWidget {

  const GuideWidget({Key? key,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
       return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              '1',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SizedBox(width: 16), // Adjust the spacing between the circle and the text
        Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '1er Etape',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Tu dois fait une inscription en ligne sur la plateforme',
              style: TextStyle(
                fontSize: 14, color: Colors.white,
              ),
            ),
          ],
        ),
        SizedBox(height: 20), 
      ],
    );
    }
}