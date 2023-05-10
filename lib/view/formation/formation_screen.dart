import 'package:eschoolapp/utils/screen_widget.dart';
import 'package:eschoolapp/widgets/deffault_app_bar.dart';
import 'package:flutter/material.dart';

class FormationScreen extends StatelessWidget {
  const FormationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeffaultAppBar(),
      body: Center(child: SingleChildScrollView(child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: buildFormationCatalogue(context),
      ))),
    );
  }
}