import 'package:eschoolapp/view/dashboard/home/screens/admin/screens/list_formation.dart';
import 'package:eschoolapp/view/dashboard/home/screens/admin/screens/list_inscri.dart';
import 'package:eschoolapp/view/dashboard/home/screens/admin/screens/list_users.dart';
import 'package:eschoolapp/view/dashboard/home/screens/admin/screens/stat_screen.dart';
import 'package:eschoolapp/view/dashboard/home/screens/commun/acceuil_screen.dart';
import 'package:eschoolapp/view/dashboard/home/screens/commun/profile_screen.dart';
import 'package:eschoolapp/view/dashboard/home/screens/parents/screens/chat_screen.dart';
import 'package:eschoolapp/view/dashboard/home/widgets/test_stat.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

final List<Widget> listDashboardAdminValues = <Widget>[
  AcceuilScreen(),
  ListUsers(),
  ListInscri(),
  ListFormation(),
  StatScreen(),
  ChatScreen(),
  ProfileScreen()
];

final List<String> listDashboardAdminKeys = <String>[
  "Acceuil",
  "Utilisateurs",
  "Inscriptions",
  "Formations",
  "Chat"
      "Statistique",
];

final List<IconData> listIconAdminKeys = [
  LineIcons.home,
  LineIcons.user,
  LineIcons.file,
  LineIcons.chalkboardTeacher,
  LineIcons.facebookMessenger,
  LineIcons.percentage,
];
