 import 'package:eschoolapp/view/welcome/components/formation_widget.dart';
import 'package:flutter/material.dart';

Column buildFormationCatalogue(BuildContext context) {
    return Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  FormationWidget(
                                    onPressed: () {
                                  //    _showConfirmationParticip(context);
                                    },
                                    image: 'assets/icons/dev.jpeg',
                                    title: 'Dévelopement Fullstack',
                                    categorie: 'Informatique',
                                    bgCategorie: Colors.deepOrange,
                                    formateur: 'Mourad M.',
                                    prix: '420 DT',
                                    dure: '4 Mois',
                                  ),
                                  FormationWidget(
                                    onPressed: () {
                                  //    _showConfirmationParticip(context);
                                    },
                                    image: 'assets/icons/marketing.jpeg',
                                    title: 'Digitale Marketing',
                                    categorie: 'Marketing',
                                    bgCategorie: Colors.deepPurple,
                                    formateur: 'Ramzi A.',
                                    prix: '200 DT',
                                    dure: '2 Mois',
                                  ),
                                  FormationWidget(
                                    image: 'assets/icons/dev.jpeg',
                                    title: 'Développement mobile',
                                    categorie: 'Informatique',
                                    bgCategorie: Colors.deepOrange,
                                    formateur: 'Ahlem N.',
                                    prix: '390 DT',
                                    dure: '3 Mois',
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: const [
                                  FormationWidget(
                                    image: 'assets/icons/dev.jpeg',
                                    title: 'Dévelopement Fullstack',
                                    categorie: 'Informatique',
                                    bgCategorie: Colors.deepOrange,
                                    formateur: 'Naim R.',
                                    prix: '420 DT',
                                    dure: '4 Mois',
                                  ),
                                  FormationWidget(
                                    image: 'assets/icons/marketing.jpeg',
                                    title: 'Digitale Marketing',
                                    categorie: 'Marketing',
                                    bgCategorie: Colors.deepPurple,
                                    formateur: 'Ghazi W.',
                                    prix: '200 DT',
                                    dure: '2 Mois',
                                  ),
                                  FormationWidget(
                                    image: 'assets/icons/dev.jpeg',
                                    title: 'Développement mobile',
                                    categorie: 'Informatique',
                                    bgCategorie: Colors.deepOrange,
                                    formateur: 'Oumaima B.',
                                    prix: '390 DT',
                                    dure: '3 Mois',
                                  ),
                                ],
                              ),
                            ],
                          );
  }