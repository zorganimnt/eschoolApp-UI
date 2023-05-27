
import 'package:eschoolapp/view/dashboard/home/screens/commun/acceuil_screen.dart';
import 'package:eschoolapp/view/dashboard/home/screens/commun/profile_screen.dart';
import 'package:eschoolapp/view/dashboard/home/screens/parents/screens/chat_screen.dart';
import 'package:eschoolapp/view/dashboard/home/widgets/test_stat.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import '../screen/list_for.dart';

final List<Widget> listDashboardApprenantValues = <Widget>[
  AcceuilScreen(),
  CoursScreen(),
  ChatScreen(),
  ProfileScreen()
];

final List<String> listDashboardApprenantKeys = <String>[
  "Acceuil",
  "Formation",
  "Chat",
];

final List<IconData> listIconApprenantKeys = [
  LineIcons.home,
  LineIcons.book,
  LineIcons.facebookMessenger,
];
