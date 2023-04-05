import 'package:eschoolapp/utils/color.dart';
import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: primaryColor,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildCategory(
                  "Dévelopement web & mobile",
                  "assets/icons/dev.jpeg",
                  "Notre centre de formation  offre une formation en dévelopement web et mobile"),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Divider(
                  height: 1.5,
                ),
              ),
              _buildCategory(
                  "Mrketing digitale",
                  "assets/icons/marketing.jpeg",
                  "Notre centre de formation  offre une formation en marketing digitale"),
            ],
          ),
        ),
      ),
    );
  }

  Column _buildCategory(titre, path, descript) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titre,
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(path), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(10),
            color: Colors.blue,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(descript),
      ],
    );
  }
}
