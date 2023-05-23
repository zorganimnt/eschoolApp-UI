import 'package:eschoolapp/utils/color.dart';
import 'package:eschoolapp/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          listPersonnes(context),
          SizedBox(
            width: 20,
          ),
          Container(
            height: MediaQuery.of(context).size.height/1.5,
            width: MediaQuery.of(context).size.width / 2.5,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.05),
                borderRadius: BorderRadius.circular(20)),

              child:  SizedBox(
                width: 300,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundImage: AssetImage('assets/icons/pdp.png'),
                                ), 
                                SizedBox(width: 10,), 
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: primaryColor.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(8)),
                                  
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(child: Text("Ahla cv? "),),
                                      ),

                                    ),
                                    SizedBox(height: 10,),
                                       Container(
                                     decoration:  BoxDecoration(
                                        color: primaryColor.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(8)),
                                    
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(child: Text("Cha3malet fi rapport rakahtou??!!"),),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                            Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                               
                              
                                Container(
                                  decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8)),
                            
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(child: Row(
                                      children: [
                                        Text("Hani wlh motnaa motén !! "),
                                        SizedBox(width: 4,), 
                                        Icon(LineIcons.angryFace, 
                                        size: 16,)
                                      ],
                                    ),),
                                  ),
                                ),
                                  SizedBox(width: 10,), 
                                 CircleAvatar(
                                  radius: 20,
                                  backgroundImage: AssetImage('assets/icons/pdp1.png'),
                                ), 
                              ],
                            ),
                          )
                        ],
                      ),
                      WidgetTextField(
                              //controller: controller.password,
                              context: context,
                             
                              label: "Envoyer un message",
                              icon: LineIcons.facebookMessenger),
                    ],
                  ),
                ),
              ),
          )
        ],
      ),
    );
  }

  Container listPersonnes(BuildContext context) {
    return Container(
          height: MediaQuery.of(context).size.height/1.5,
          width: MediaQuery.of(context).size.width / 4.8,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                  width: 260,
                  child: WidgetTextField(
                      //controller: controller.password,
                      context: context,
                      hintText: "Recherche quelqu'un",
                      label: "Recherce",
                      icon: LineIcons.search)),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 60,
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.1),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 21,
                            backgroundImage:
                                AssetImage('assets/icons/pdp.png'),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Rania Ben Ammar",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Merci pour...",
                              )
                            ],
                          ),
                        ],
                      ),
                      Text(
                        "14:44",
                        style: TextStyle(color: Colors.grey),
                      )
                    ]),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 21,
                            backgroundImage:
                                AssetImage('assets/icons/pdp1.png'),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Jihene Abidi",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Salut madame...",
                              )
                            ],
                          ),
                        ],
                      ),
                      Text(
                        "17:04",
                        style: TextStyle(color: Colors.grey),
                      )
                    ]),
              ),
            ),
            Container(
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 21,
                            backgroundImage:
                                AssetImage('assets/icons/logo-app.png'),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Foulen X",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Merci pour...",
                              )
                            ],
                          ),
                        ],
                      ),
                      Text(
                        "10:44",
                        style: TextStyle(color: Colors.grey),
                      )
                    ]),
              ),
            )
          ]),
        );
  }
}
