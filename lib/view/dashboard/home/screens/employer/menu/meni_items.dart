

import 'package:eschoolapp/view/dashboard/home/screens/admin/screens/list_formation.dart';
import 'package:eschoolapp/view/dashboard/home/screens/commun/acceuil_screen.dart';
import 'package:eschoolapp/view/dashboard/home/screens/commun/profile_screen.dart';
import 'package:eschoolapp/view/dashboard/home/screens/parents/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import '../screen/Affecter_canal.dart';

final List<Widget> listDashboardEmployerValues = <Widget>[
  AcceuilScreen(),
   Listcanal(),
  ChatScreen(),
  ProfileScreen()
];

final List<String> listDashboardEmployerKeys = <String>[
  "Acceuil",
  'Affecter apprenant',
  "Chat",
];

final List<IconData> listIconEmployerKeys = [
  LineIcons.home,
  LineIcons.book,
  LineIcons.facebookMessenger,
  
];
