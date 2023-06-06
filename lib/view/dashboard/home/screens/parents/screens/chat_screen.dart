import 'package:eschoolapp/controller/chat_controller.dart';
import 'package:eschoolapp/utils/color.dart';
import 'package:eschoolapp/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});
  final ChatController controller = Get.put(ChatController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(
        builder: (_) => Padding(
              padding: const EdgeInsets.all(40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  listPersonnes(context),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 1.5,
                    width: MediaQuery.of(context).size.width / 2.5,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(20)),
                    child: SizedBox(
                      width: 300,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                        radius: 20,
                                        backgroundImage:
                                            AssetImage('assets/icons/pdp.png'),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                color: primaryColor
                                                    .withOpacity(0.1),
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Center(
                                                child: Text("Bonjour !"),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                        /*   SizedBox(
                                            height: 300,
                                            child: ListView.builder(
                                                itemCount: controller.id.length,
                                                itemBuilder: (context, index) {
                                                  return Container(
                                                    decoration: BoxDecoration(
                                                        color: primaryColor
                                                            .withOpacity(0.1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8)),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Center(
                                                        child: Text(controller
                                                            .msg[index]),
                                                      ),
                                                    ),
                                                  );
                                                }),
                                          ), */
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Center(
                                            child: Text("Merci"),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      CircleAvatar(
                                        radius: 20,
                                        backgroundImage:
                                            AssetImage('assets/icons/pdp1.png'),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 380,
                                  child: WidgetTextField(
                                      controller: controller.msgContent,
                                      context: context,
                                      label: "Envoyer un message",
                                      icon: LineIcons.facebookMessenger),
                                ),
                                IconButton(
                                    onPressed: () {
                                      controller.sendMessage();
                                    },
                                    icon: Icon(Icons.send_rounded))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ));
  }

  Container listPersonnes(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.5,
      width: MediaQuery.of(context).size.width / 4.8,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
              width: MediaQuery.of(context).size.height / 2,
              child: WidgetTextField(
                  onChanged: (value) {
                    // ignore: unnecessary_null_comparison
                    controller.searchName.text != ''
                        ? clearAndGet()
                        : controller.clearList();
                  },
                  controller: controller.searchName,
                  context: context,
                  hintText: "Recherche quelqu'un",
                  label: "Recherce",
                  icon: LineIcons.search)),
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: ListView.builder(
                itemCount: controller.id.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      onTap: () {
                        controller.chnangeReceiverId(controller.id[index]);
                        Future.delayed(Duration(seconds: 2));
                        controller.getConver();
                      },
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 21,
                            backgroundImage:
                                AssetImage('assets/icons/pdp1.png'),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "${controller.nom[index]} ${controller.prenom[index]}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  );
                })),
        SizedBox(
          height: 8,
        ),
      ]),
    );
  }

  void clearAndGet() {
    controller.clearList();
    Future.delayed(Duration(seconds: 2));
    controller.searchUser();
  }
}
