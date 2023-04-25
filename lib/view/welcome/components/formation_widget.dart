import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class FormationWidget extends StatelessWidget {
  final String image;
  final String title; 
  final String categorie; 
  final String formateur; 
  final String prix; 
  final String dure; 
  final Color bgCategorie; 

  const FormationWidget({
    Key? key, required this.image, required this.title, required this.formateur, required this.prix, required this.dure, required this.categorie, required this.bgCategorie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 350,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(15),
                  image: DecorationImage(
                      image: AssetImage(
                          image),
                      fit: BoxFit.cover)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 20.0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 30,
                      width: 100,
                      decoration: BoxDecoration(
                          color: bgCategorie
                              .withOpacity(0.5),
                          borderRadius:
                              BorderRadius.circular(
                                  15)),
                      child: Center(
                          child: Text(
                      categorie,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight:
                                FontWeight.bold),
                      )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      title,
                      style: TextStyle(
                          fontWeight:
                              FontWeight.bold,
                          fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  CircleAvatar(
                      radius: 17,
                      backgroundColor: Colors.blue
                          .withOpacity(0.1),
                      child: Icon(LineIcons.user)),
                  SizedBox(
                    width: 4,
                  ),
                  Text(formateur),
                ],
              ),
              Row(
                children: [
                  CircleAvatar(
                      radius: 17,
                      backgroundColor: Colors.orange
                          .withOpacity(0.1),
                      child: Icon(
                          LineIcons.dollarSign)),
                  SizedBox(
                    width: 4,
                  ),
                  Text(prix),
                ],
              ),
              Row(
                children: [
                  CircleAvatar(
                      radius: 17,
                      backgroundColor: Colors.red
                          .withOpacity(0.1),
                      child: Icon(LineIcons.clock)),
                  SizedBox(
                    width: 4,
                  ),
                  Text(dure),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
