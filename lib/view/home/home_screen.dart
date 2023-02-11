import 'package:flutter/material.dart';

class HomeScreeen extends StatelessWidget {
  final String token; 
  final String? role; 
  const HomeScreeen({super.key, required this.token, this.role});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("D5alet lel app w token mte3i : "),
          SizedBox(height: 20,),
          Text(token), 
          SizedBox(height: 20,), 
          Column(
            children: [
              Text("role mte3i : "),
              Text(role??''), 
            ],
          )
        ],
      )),
    );
  }
}