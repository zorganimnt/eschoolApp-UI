import 'package:eschoolapp/utils/color.dart';
import 'package:eschoolapp/view/auth/components/drop_down_role.dart';
import 'package:eschoolapp/widgets/custom_button.dart';
import 'package:eschoolapp/widgets/deffault_app_bar.dart';
import 'package:eschoolapp/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

class NextStepRegister extends StatelessWidget {
  final String? role;
  const NextStepRegister({super.key, this.role});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DeffaultAppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2.8,
                  height: 500,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          image: AssetImage('assets/icons/register.jpeg'),
                          fit: BoxFit.cover)),
                ),
                if (role == "Apprenant") _registerApprenant(context),
                if (role == "Parent") _registerParent(context),
                if (role == "Formateur") _registerFormateur(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox _registerApprenant(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2.4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Comme étant apprenant, veuillez remplir ces informations",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black54),
          ),
          SizedBox(
            height: 20,
          ),
          WidgetTextField(
              context: context,
              hintText: "DD/MM/YYYY",
              label: "Date de naissance",
              isPassword: true,
              icon: LineIcons.birthdayCake),
          SizedBox(
            height: 15,
          ),
          WidgetTextField(
              context: context,
              hintText: "Entrer votre niveau scolaire",
              label: "Niveau Scolaire",
              isPassword: true,
              icon: LineIcons.school),
          SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            //margin: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextButton(
              onPressed: () {
                //  Get.toNamed(AppRoutes.home);
              },
              child: const Text(
                "Confirmer",
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox _registerParent(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2.4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Comme étant parent, veuillez remplir ces informations",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black54),
          ),
          SizedBox(
            height: 20,
          ),
          WidgetTextField(
              context: context,
              hintText: "exemple@mail.com",
              label: "E-mail de votre enfant",
              isPassword: true,
              icon: LineIcons.birthdayCake),
          SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            //margin: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextButton(
              onPressed: () {
                //  Get.toNamed(AppRoutes.home);
              },
              child: const Text(
                "Confirmer",
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox _registerFormateur(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2.4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Comme étant formateur, veuillez remplir ces informations",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black54),
          ),
          SizedBox(
            height: 20,
          ),
          WidgetTextField(
              context: context,
              hintText: "Ex. Informatique",
              label: "Spécialité",
              isPassword: true,
              icon: LineIcons.laptop),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(onPressed: () {}, child: Row(
                children: [
                  Icon(LineIcons.file), 
                  SizedBox(width: 8,), 
                  Text('Upload CV'),
                ],
              )),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            //margin: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextButton(
              onPressed: () {
                //  Get.toNamed(AppRoutes.home);
              },
              child: const Text(
                "Confirmer",
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
