
import 'package:eschoolapp/view/dashboard/home/screens/admin/screens/list_formation.dart';
import 'package:eschoolapp/view/dashboard/home/screens/admin/screens/list_inscri.dart';
import 'package:eschoolapp/view/dashboard/home/screens/admin/screens/list_users.dart';
import 'package:eschoolapp/view/dashboard/home/screens/commun/acceuil_screen.dart';
import 'package:eschoolapp/view/dashboard/home/screens/commun/profile_screen.dart';
import 'package:eschoolapp/view/dashboard/home/screens/parents/screens/chat_screen.dart';
import 'package:eschoolapp/view/dashboard/home/widgets/test_stat.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

final List<Widget> listDashboardEmployerValues = <Widget>[
  AcceuilScreen(),
  ListUsers(),
  ChatScreen(),
  ProfileScreen()
];

final List<String> listDashboardEmployerKeys = <String>[
  "Acceuil",
  "Absence",
  "Chat",
];

final List<IconData> listIconEmployerKeys = [
  LineIcons.home,
  LineIcons.list,
  LineIcons.facebookMessenger,
  
];
