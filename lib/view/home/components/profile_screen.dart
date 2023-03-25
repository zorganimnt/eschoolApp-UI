import 'package:eschoolapp/utils/color.dart';
import 'package:eschoolapp/widgets/show_dialog.dart';
import 'package:flutter/material.dart';

Future<void> _editDialog(context, dialogContent) async {
  return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return dialogContent;
      });
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Column(
              children: [
                Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    const CircleAvatar(
                      radius: 42,
                      backgroundImage: AssetImage("assets/icons/pdp1.png"),
                    ),
                    CircleAvatar(
                      foregroundColor: Colors.white,
                      backgroundColor: primaryColor,
                      radius: 14,
                      child: Icon(
                        Icons.photo_camera_rounded,
                        size: 15,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Jihene Abidi",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  "Étudiant",
                  style: TextStyle(color: Colors.grey, fontSize: 13),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            buildContantInfo(context),
            SizedBox(
              height: 20,
            ),
            ParametreItemWidget(
              icon: Icons.lock_outline_rounded,
              title: "Change mot de passe",
              direction: () {},
            ),
            SizedBox(
              height: 10,
            ),
            ParametreItemWidget(
              icon: Icons.support_agent_outlined,
              title: "Contact support",
              direction: () {},
            ),
            SizedBox(
              height: 10,
            ),
            ParametreItemWidget(
              icon: Icons.help_outline,
              title: "Besoin d'aide",
              direction: () {},
            )
          ],
        ),
      ),
    );
  }

  Container buildContantInfo(context) {
    return Container(
      height: 180,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.4),
          spreadRadius: 0.2,
          blurRadius: 0.2,
        ),
      ], borderRadius: BorderRadius.circular(15), color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.person_outline,
                        size: 17,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text("Nom"),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Jihene Abidi",
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      InkWell(
                        onTap: () {
                          _editDialog(
                              context,
                              ShowDialog(
                                title: Text("Modifier nom"),
                                body: TextField(
                                  keyboardType: TextInputType.number,
                                  textAlignVertical: TextAlignVertical.center,
                                  autofocus: true,
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                    
                                      hintText: "Enter numéro",
                                      hintStyle:
                                          TextStyle(color: Colors.grey[300]!),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 1,
                                              color: Colors.grey[300]!)),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 1,
                                              color: Colors.grey[300]!)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 1,
                                              color: Colors.grey[300]!))),
                                ),
                              ));
                        },
                        child: Icon(
                          Icons.edit_outlined,
                          color: Colors.grey,
                          size: 14,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Divider(
              height: 1.5,
            ),
            InkWell(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.mail_outline,
                        size: 17,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text("Email"),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "mail@mail.com",
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Icon(
                        Icons.edit_outlined,
                        color: Colors.grey,
                        size: 14,
                      )
                    ],
                  )
                ],
              ),
            ),
            Divider(
              height: 1.5,
            ),
            InkWell(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.phone_outlined,
                        size: 17,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text("Téléphone"),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "20300200",
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Icon(
                        Icons.edit_outlined,
                        color: Colors.grey,
                        size: 14,
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildUniverInfo() {
    return Container(
      height: 180,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.4),
          spreadRadius: 1,
          blurRadius: 3,
        ),
      ], borderRadius: BorderRadius.circular(15), color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.person_outline,
                        size: 17,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text("Nom"),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Rania Ben Ammar",
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Icon(
                        Icons.edit_outlined,
                        color: Colors.grey,
                        size: 14,
                      )
                    ],
                  )
                ],
              ),
            ),
            Divider(
              height: 1.5,
            ),
            InkWell(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.mail_outline,
                        size: 17,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text("Email"),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "mail@mail.com",
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Icon(
                        Icons.edit_outlined,
                        color: Colors.grey,
                        size: 14,
                      )
                    ],
                  )
                ],
              ),
            ),
            Divider(
              height: 1.5,
            ),
            InkWell(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.phone_outlined,
                        size: 17,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text("Téléphone"),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "20300200",
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Icon(
                        Icons.edit_outlined,
                        color: Colors.grey,
                        size: 14,
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ParametreItemWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function()? direction;
  const ParametreItemWidget({
    Key? key,
    required this.icon,
    required this.title,
    this.direction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: direction,
      child: Container(
        height: 50,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 0.2,
            blurRadius: 0.2,
          ),
        ], borderRadius: BorderRadius.circular(15), color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              children: [
                Icon(
                  icon,
                  size: 16,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(title)
              ],
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 14,
              color: Colors.black87,
            )
          ]),
        ),
      ),
    );
  }
}
