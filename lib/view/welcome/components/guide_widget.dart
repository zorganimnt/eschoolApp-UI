import 'package:eschoolapp/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

import '../../../routes/app_routes.dart';

class GuideWidget extends StatelessWidget {

  const GuideWidget({Key? key,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
       return Scaffold(
   
             body: Container(
              width:900,
               height:1000,
               
        decoration: BoxDecoration(
      
          image: DecorationImage(
          
           // image: AssetImage('assets/icons/guide.png'),
            fit: BoxFit.cover,
            alignment: Alignment.center,
              
          ),
        ),
        child: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
     child:Column( children: [
      Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
      InkWell(
                                                onTap: () {
                                                  Get.toNamed(AppRoutes.welcome);
                                                },
                                                child: Container(
                                                  height: 30,
                                                  width: MediaQuery.of(context).size.width * .1,
                                                  decoration: BoxDecoration(
      color: Color.fromARGB(255, 255, 255, 255),
      borderRadius: BorderRadius.circular(15),
    ),
    child: Icon(
      Icons.arrow_back,
      color: Color.fromARGB(255, 97, 147, 223),
      size: 24,
    ),
  ),
),
  SizedBox(width: 16),
        Container(
          width: 80,
          height: 80,
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
                fontSize: 14, color: Colors.black,
              ),
            ),
          ],
        ),
        SizedBox(height: 20), 
Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 219, 100, 194),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              '2',
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
              '2er Etape',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Tu dois fait une inscription en ligne sur la plateforme',
              style: TextStyle(
                fontSize: 14, color: Colors.black,
              ),
            ),
          ],
        ),
         SizedBox(height: 20),
        Container(
          width: 80,
          height:80,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 49, 221, 86),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              '3',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SizedBox(width: 16), 
        // Adjust the spacing between the circle and the text
        Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '3er Etape',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                
              ),
            ),
            Text(
              'Tu dois fait une inscription en ligne sur la plateforme',
              style: TextStyle(
                fontSize: 14, color: Colors.black,
              ),
            ),
          ],
        ),
       

          SizedBox(height: 20), 
Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 226, 149, 34),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              '4',
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
              '4er Etape',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Tu dois fait une inscription en ligne sur la plateforme',
              style: TextStyle(
                fontSize: 14, color: Colors.black,
              ),
            ),
          ],
        ),
      ],
     ),
     

     ],
    ),
              ),
              ),),
       );
    }
}