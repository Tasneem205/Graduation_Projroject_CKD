import 'package:flutter/material.dart';
import 'package:user_app/Classes/language_constants.dart';
import 'package:user_app/pages/Walking.dart';

class Pressure extends StatefulWidget {
  const Pressure({super.key});

  @override
  State<Pressure> createState() => _PressureState();
}

class _PressureState extends State<Pressure> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
        backgroundColor: Color(0xffF2F7FD),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xffFFFFFF),
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return Expanded(
                      child: Center(
                    child: AlertDialog(
                      title: Center(
                        child: Text(
                          translation(context).pressure,
                          style: const TextStyle(
                              color: Color(0xFF0E725B), fontSize: 29),
                        ),
                      ),
                      content: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 70,
                            height: 100,
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(

                                      // hintText:"--------------------",
                                      ),
                                ),
                                Text(
                                  "    SYS",
                                  style: TextStyle(
                                      color: Color(0xFF0E725B), fontSize: 20),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 70,
                            height: 100,
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(

                                      // hintText:"--------------------",
                                      ),
                                ),
                                Text(
                                  "    DIA",
                                  style: TextStyle(
                                      color: Color(0xFF0E725B), fontSize: 20),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            width: 70,
                            height: 100,
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(

                                      // hintText:"--------------------"
                                      ),
                                ),
                                Text(
                                  "    PUL",
                                  style: TextStyle(
                                      color: Color(0xFF0E725B), fontSize: 20),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      actions: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  translation(context).save,
                                  style: const TextStyle(
                                      color: Color(0xFF0E725B), fontSize: 20),
                                )),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const Pressure()));
                                },
                                child: Text(
                                  translation(context).cancel,
                                  style: const TextStyle(
                                      color: Color(0xFF0E725B), fontSize: 20),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ));
                });
          },
          child: const Icon(
            Icons.add,
            size: 50,
            color: Color(0xFF0E725B),
          ),
        ),
        appBar: AppBar(
          backgroundColor: Color(0xffF2F7FD),
            title: Text(translation(context).pressure,
                style: const TextStyle(
                    color: Color(0xff0C8A7D),
                    fontSize: 24,
                    fontWeight: FontWeight.normal),
                textAlign: TextAlign.start),
            elevation: 0.0,
            iconTheme: const IconThemeData(color: Color(0xff0C8A7D), size: 27)),
        body: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                //this week Container
                ContainerCard(
                  containerWidget: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        translation(context).today,
                        style: const TextStyle(color: Color(0xff0C8A7D)),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const SharedColorText(
                        text: "-----------",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SharedText(
                        text: translation(context).notyet,
                        fontSize: 10,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: ContainerCard(
                    containerWidget: Column(children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(translation(context).feb18,
                                style: const TextStyle(
                                    fontSize: 16, color: Color(0xff0C8A7D))),
                            Text(translation(context).high,
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 14,
                                )),
                          ]),

                      const PressureList(),
                      ]),
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: ContainerCard(
                    containerWidget: Column(children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(translation(context).feb17,
                                style: const TextStyle(
                                    fontSize: 16, color: Color(0xff0C8A7D))),
                            Text(translation(context).high,
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 14,
                                )),
                          ]),

                      const PressureList(),
                      ]),
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: ContainerCard(
                    containerWidget: Column(children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(translation(context).feb16,
                                style: const TextStyle(
                                    fontSize: 16, color: Color(0xff0C8A7D))),
                            Text(translation(context).high,
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 14,
                                )),
                          ]),

                      const PressureList(),
                      ]),
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: ContainerCard(
                    containerWidget: Column(children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(translation(context).feb15,
                                style: const TextStyle(
                                    fontSize: 16, color: Color(0xff0C8A7D))),
                            Text(translation(context).high,
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 14,
                                )),
                          ]),

                      const PressureList(),
                      ]),
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: ContainerCard(
                    containerWidget: Column(children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(translation(context).feb14,
                                style: const TextStyle(
                                    fontSize: 16, color: Color(0xff0C8A7D))),
                            Text(translation(context).high,
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 14,
                                )),
                          ]),

                      const PressureList(),
                      ]),
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),
              ]),
        ),
      ),
    );
  }
}

class PressureList extends StatelessWidget {
  const PressureList({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, 
    children: [
      Column(children: [
        const Text("118",
            style: TextStyle(
                color: Colors.black87,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        Container(height: 10),
        const Text("SYS", style: TextStyle(color: Colors.black87, fontSize: 20)),
      ]),
      Column(children: [
        const Text("76",
            style: TextStyle(
                color: Colors.black87,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        Container(height: 10),
        const Text("DIA", style: TextStyle(color: Colors.black87, fontSize: 20)),
      ]),
      Column(children: [
        const Text("73",
            style: TextStyle(
                color: Colors.black87,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        Container(height: 10),
        const Text("PUL", style: TextStyle(color: Colors.black87, fontSize: 20)),
      ]),
    ]);
  }
}
