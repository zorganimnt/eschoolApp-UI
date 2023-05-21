import 'package:eschoolapp/controller/register_controller.dart';
import 'package:eschoolapp/utils/color.dart';
import 'package:eschoolapp/utils/dialog.dart';
import 'package:eschoolapp/view/auth/components/drop_down_niveau.dart';
import 'package:eschoolapp/view/auth/components/drop_down_role.dart';
import 'package:eschoolapp/view/auth/components/drop_down_speciality.dart';
import 'package:eschoolapp/view/auth/components/pick_cv.dart';
import 'package:eschoolapp/view/auth/reigster_screen.dart';
import 'package:eschoolapp/widgets/custom_button.dart';
import 'package:eschoolapp/widgets/deffault_app_bar.dart';
import 'package:eschoolapp/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class NextStepRegister extends StatelessWidget {
  final String? role;
  final RegisterController controller = Get.put(RegisterController());
  NextStepRegister({super.key, this.role});
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
                          image: AssetImage('assets/icons/user-registration.png'),
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
    var maskFormatter = MaskTextInputFormatter(
        mask: '##/##/####', filter: {"#": RegExp(r'[0-9]')});
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
              inputFormatters: [maskFormatter],
              context: context,
              hintText: "DD/MM/YYYY",
              label: "Date de naissance",
              controller: controller.birthDay,
              icon: LineIcons.birthdayCake),
          SizedBox(
            height: 15,
          ),
          LevelDropDown(),
          SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            //margin: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextButton(
              onPressed: () {
                controller.registerApprenant(context);
                showConfirmation(context);
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
            controller: controller.emailChild,
              context: context,
              hintText: "exemple@mail.com",
              label: "E-mail de votre enfant",
              icon: LineIcons.envelope),
          SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            //margin: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextButton(
              onPressed: () {
                controller.registerParent(context); 
                showConfirmation(context);
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
          DropDownSpeciality(), 
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PickCV()
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
                controller.registerFormateur(context);
                showConfirmation(context);
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
