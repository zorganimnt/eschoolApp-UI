import 'package:eschoolapp/controller/dashboard_controller.dart';
import 'package:eschoolapp/controller/profile_controller.dart';
import 'package:eschoolapp/utils/color.dart';
import 'package:eschoolapp/widgets/show_dialog.dart';
import 'package:eschoolapp/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

Future<void> _editDialog(context, dialogContent) async {
  return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return dialogContent;
      });
}

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final ProfileController controller = Get.put(ProfileController());
  final DashboardController dashController = Get.put(DashboardController()); 
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
        builder: (_) => Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(150, 40, 150, 40),
                child: Column(
                  children: [
                    InkWell(
                      hoverColor: Colors.transparent,
                      radius: 90,
                      onHover: (value) {
                        controller.showCamera(value);
                      },
                      onTap: () {},
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundImage:
                                AssetImage("assets/icons/admin.png"),
                          ),
                          controller.isHover.value
                              ? Stack(
                                  alignment: AlignmentDirectional.center,
                                  children: [
                                    CircleAvatar(
                                      radius: 60,
                                      backgroundColor:
                                          Colors.black.withOpacity(0.5),
                                    ),
                                    Icon(
                                      LineIcons.camera,
                                      size: 30,
                                      color: Colors.white70,
                                    ),
                                  ],
                                )
                              : SizedBox(),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    buildContantInfo(context),
                    SizedBox(
                      height: 20,
                    ),
                  
                            ],
                          ),
                        ),
                      ));
                      }
            Container buildContantInfo(context) {
    return Container(
      height: 180,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.4),
          spreadRadius: 0.4,
          blurRadius: 0.4,
        ),
      ], borderRadius: BorderRadius.circular(15), color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            EditProfileItem(
                title: "Nom ",
                icon: LineIcons.user,
                onTap: () {
                  _editDialog(
                      context,
                      ShowDialog(
                        title: Text("Modifier nom "),
                        body: WidgetTextField(
                            controller: dashController.newName,
                            context: context,
                            hintText: "Ex. Foulen",
                            label: "Nouveau nom ",
                            icon: LineIcons.user),
                            onConfirm: () {
                              dashController.modifyProfile(); 
                            },
                      ));
                },
                textData: dashController.nameCurrentUser.value),
            Divider(
              height: 1.5,
            ),
            EditProfileItem(
                title: "prénom",
                icon: LineIcons.user,
                onTap: () {
                  _editDialog(
                      context,
                      ShowDialog(
                        title: Text("Modifier prénom"),
                        body: WidgetTextField(
                            controller: dashController.newLastName,
                            context: context,
                            hintText: "Ex. Foulen",
                            label: "Nouveau prénom",
                            icon: LineIcons.user),
                            onConfirm: () {
                                                            dashController.modifyProfile(); 

                            },
                      ));
                },
                textData: dashController.lastNameCurrentUser.value),
            Divider(
              height: 1.5,
            ),
            EditProfileItem(
                title: "Adresse e-mail",
                icon: LineIcons.envelope,
                onTap: () {
                   _editDialog(
                      context,
                      ShowDialog(
                        title: Text("Modifier e-mail"),
                        body: WidgetTextField(
                          controller: dashController.newEmail,
                            context: context,
                            hintText: "Ex. mail@exemple.com",
                            label: "Nouveau e-mail",
                            icon: LineIcons.envelope),
                            onConfirm: () {
                                                            dashController.modifyProfile(); 

                            },
                      ));
                },
                textData: dashController.emailCurrentUser.value),
            Divider(
              height: 1.5,
            ),
            EditProfileItem(
                title: "Numéro de téléphone",
                icon: LineIcons.phone,
                onTap: () {
                   _editDialog(
                      context,
                      ShowDialog(
                        title: Text("Modifier téléphone"),
                        body: WidgetTextField(
                           controller: dashController.newPhone,
                            context: context,
                            hintText: "Ex. 21300200",
                            label: "Nouveau téléphone",
                            icon: LineIcons.phone),
                            onConfirm: () {
                                                            dashController.modifyProfile(); 

                            },
                      ));
                },
                textData: dashController.phoneCurrentUser.value),
          ],
        ),
      ),
    );
  }      
  }

  


class EditProfileItem extends StatelessWidget {
  final String title;
  final String textData;
  final IconData? icon;
  final void Function()? onTap;

  const EditProfileItem({
    Key? key,
    required this.title,
    required this.textData,
    this.icon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              icon,
              size: 17,
            ),
            SizedBox(
              width: 11,
            ),
            Text(
              title,
            ),
          ],
        ),
        Row(
          children: [
            Text(
              textData,
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(
              width: 8,
            ),
            InkWell(
              onTap: onTap,
              child: Icon(
                Icons.edit_outlined,
                color: Colors.grey,
                size: 14,
              ),
            )
          ],
        )
      ],
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
            spreadRadius: 0.4,
            blurRadius: 0.4,
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