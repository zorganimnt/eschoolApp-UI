import 'package:eschoolapp/view/dashboard/home/screens/admin/screens/list_formation.dart';
import 'package:eschoolapp/view/dashboard/home/screens/admin/screens/list_inscri.dart';
import 'package:eschoolapp/view/dashboard/home/screens/admin/screens/list_users.dart';
import 'package:eschoolapp/view/dashboard/home/screens/admin/screens/stat_screen.dart';
import 'package:eschoolapp/view/dashboard/home/screens/commun/acceuil_screen.dart';
import 'package:eschoolapp/view/dashboard/home/screens/commun/profile_screen.dart';
import 'package:eschoolapp/view/dashboard/home/screens/formateur/screens/cours_screen.dart';
import 'package:eschoolapp/view/dashboard/home/screens/formateur/screens/list_absence.dart';
import 'package:eschoolapp/view/dashboard/home/widgets/test_stat.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

final List<Widget> listDashboardFormateurValues = <Widget>[
  AcceuilScreen(),
  CourScreen(),
  ListAbsence(),
  ListAbsence(),
  ProfileScreen()
];

final List<String> listDashboardFormateurKeys = <String>[
  "Acceuil",
  "Cours",
  "Chat",
  "Absence",
];

final List<IconData> listIconFormateurKeys = [
  LineIcons.home,
  LineIcons.book,
  LineIcons.facebookMessenger,
  LineIcons.list,
];
