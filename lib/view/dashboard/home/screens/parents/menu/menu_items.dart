import 'package:eschoolapp/view/dashboard/home/screens/admin/screens/list_formation.dart';
import 'package:eschoolapp/view/dashboard/home/screens/admin/screens/list_inscri.dart';
import 'package:eschoolapp/view/dashboard/home/screens/admin/screens/list_users.dart';
import 'package:eschoolapp/view/dashboard/home/screens/commun/acceuil_screen.dart';
import 'package:eschoolapp/view/dashboard/home/screens/commun/profile_screen.dart';
import 'package:eschoolapp/view/dashboard/home/screens/parents/screens/avancement_screen.dart';
import 'package:eschoolapp/view/dashboard/home/screens/parents/screens/chat_screen.dart';
import 'package:eschoolapp/view/dashboard/home/widgets/test_stat.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../screens/List_notif.dart';

final List<Widget> listDashboardParentValues = <Widget>[
  AcceuilScreen(),
  AvancementScreen(), 
  Listnotif(),
  ChatScreen(),
  ProfileScreen()
];

final List<String> listDashboardParentKeys = <String>[
  "Acceuil",
  "Avancement",
  "Notification",
  "Chat",
];

final List<IconData> listIconParentKeys = [
  LineIcons.home,
  LineIcons.alternateList,
 Icons.notifications_outlined,
  LineIcons.facebookMessenger,
];
