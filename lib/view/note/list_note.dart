import 'package:eschoolapp/controller/tab_note_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Note {
  final String nameMatiere;
  final String noteStudent;

  Note({required this.nameMatiere, required this.noteStudent});
}

// nafes lahkeya li aamltha nty mais ena 9arebtk leli bech naamlou baed bel mode
List<Note> _notes = [
  Note(nameMatiere: "Français", noteStudent: "19.75"),
  Note(nameMatiere: "Informatique", noteStudent: "20.15"),
];

class ListNoteScreen extends StatelessWidget {
  ListNoteScreen({super.key});
  TabNoteController tabController = Get.put(TabNoteController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // hedhi bech nafichi bih esemi les tables (ds, o ghirou bech najem navigi binethom)
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(30.0),
            child: TabBar(
              indicatorWeight: 2,
              labelColor: Colors.black,
              indicatorColor: Colors.pink,
              isScrollable: true,
              controller: tabController.tbcontroller,
              tabs: tabController.myTabs,
              indicatorSize: TabBarIndicatorSize.label,
            ),
          ),
          elevation: 1,
          iconTheme: IconThemeData(color: Colors.deepPurple),
          backgroundColor: Colors.white,
          title: Text(
            "Liste Notes",
            style: TextStyle(color: Colors.black87),
          ),
          centerTitle: true,
        ),
      ),
      body: TabBarView(controller: tabController.tbcontroller, children: [
        // li bech nafichih hne dpend lel tab controller li aamltha fel controller
        // TabBarView hedhi Item mte3ha hiya 3ibara list ,
        // fiha padding 1 , 2, 3, 4 w kol padding fi tab (ds, examen , orale, tp)
        // aya mela chedli rouhk hhhhhh bara aya
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Matiere",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("Note",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(height: 4),
                    Divider(
                      height: 1.5,
                    ),
                    SizedBox(height: 6),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                      itemCount: _notes.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(_notes[index].nameMatiere),
                                  Text(_notes[index].noteStudent)
                                ],
                              ),
                              SizedBox(height: 4),
                              Divider(
                                height: 1.5,
                              )
                            ],
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) {
                return Text("hne nafichi l Examen");
              }),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) {
                return Text("hne nafichi l Orale");
              }),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) {
                return Text("hne nafichi l TP");
              }),
        ),
      ]),
    );
  }
}
