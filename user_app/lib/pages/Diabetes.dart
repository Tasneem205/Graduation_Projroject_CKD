import 'package:flutter/material.dart';
import 'package:user_app/Classes/language_constants.dart';
import 'package:user_app/pages/Walking.dart';

class Diabetes extends StatefulWidget {
  const Diabetes({Key? key}) : super(key: key);

  @override
  State<Diabetes> createState() => _DiabetesState();
}

class _DiabetesState extends State<Diabetes> {
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
                        child: Text(translation(context).diabetes,
                          style:
                              const TextStyle(color: Color(0xFF0E725B), fontSize: 29),
                        ),
                      ),
                      content: const TextField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "---------------------",
                        ),
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
                                      builder: (context) => const Diabetes()));
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
            color: const Color(0xFF0E725B),
          ),
        ),
      appBar: AppBar(
        backgroundColor: Color(0xffF2F7FD),
      title:  Text(translation(context).diabetes,
              style: const TextStyle(
                  color: Color(0xff0C8A7D),
                  fontSize: 24,
                  fontWeight: FontWeight.normal),
              textAlign: TextAlign.start),
        elevation: 0.0,
          iconTheme: const IconThemeData(color: Color(0xff0C8A7D), size: 27)),
      body:SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
          const  SizedBox(height: 10,),
            //this week Container
             ContainerCard(
              containerWidget: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SharedText(
                    text: translation(context).today,
                  ),
                  const SizedBox(height: 5,),
                  const SharedColorText(text:"-----------",),
                  const SizedBox(height: 5,),
                  SharedText(text: translation(context).notyet,fontSize: 10,),

                ],


              ),
            ),
            const    SizedBox(height: 20,),
                  
                    Padding(
                      padding:  const EdgeInsets.only(bottom: 10),
                      child:  ContainerCard(
                        containerWidget: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                              Text(
                                 translation(context).feb18,style: const TextStyle(
                                  fontSize: 16,color:Color(0xff0C8A7D)
                                ),),
                                Text(translation(context).high,
                                style: const TextStyle(
                                color:Colors.red,fontSize: 14,),),

                              ],),
                          
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 1, 5, 9),
                        alignment: Alignment.topLeft,
                        child: const Text(
                          "159",
                          style: TextStyle(color: Colors.black87, fontSize: 21),
                        ),
                      )
                    ],
                  ),
                ),),
                const SizedBox(
                  height: 20,
                ),
                
                    Padding(
                      padding:  const EdgeInsets.only(bottom: 10),
                      child:  ContainerCard(
                        containerWidget: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                              Text(
                                 translation(context).feb17,style: const TextStyle(
                                  fontSize: 16,color:Color(0xff0C8A7D)
                                ),),
                                Text(translation(context).normal,
                                style: const TextStyle(
                                color:Colors.red,fontSize: 14,),),

                              ],),
                          
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 1, 5, 9),
                        alignment: Alignment.topLeft,
                        child: const Text(
                          "115",
                          style: TextStyle(color: Colors.black87, fontSize: 21),
                        ),
                      )
                    ],
                  ),
                ),),
                const SizedBox(
                  height: 20,
                ),
              
                    Padding(
                      padding:  const EdgeInsets.only(bottom: 10),
                      child:  ContainerCard(
                        containerWidget: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                              Text(
                                 translation(context).feb16,style: const TextStyle(
                                  fontSize: 16,color:Color(0xff0C8A7D)
                                ),),
                                Text(translation(context).high,
                                style: const TextStyle(
                                color:Colors.red,fontSize: 14,),),

                              ],),
                          
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 1, 5, 9),
                        alignment: Alignment.topLeft,
                        child: const Text(
                          "200",
                          style: TextStyle(color: Colors.black87, fontSize: 21),
                        ),
                      )
                    ],
                  ),
                ),),
                const SizedBox(
                  height: 20,
                ),
                
                    Padding(
                      padding:  const EdgeInsets.only(bottom: 10),
                      child:  ContainerCard(
                        containerWidget: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                              Text(
                                 translation(context).feb15,style: const TextStyle(
                                  fontSize: 16,color:Color(0xff0C8A7D)
                                ),),
                                Text(translation(context).high,
                                style: const TextStyle(
                                color:Colors.red,fontSize: 14,),),

                              ],),
                          
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 1, 5, 9),
                        alignment: Alignment.topLeft,
                        child: const Text(
                          "284",
                          style: TextStyle(color: Colors.black87, fontSize: 21
                          ),
                        ),
                      )
                    ],
                  ),
                ),),
                const SizedBox(
                  height: 20,
                ),
                
                    Padding(
                      padding:  const EdgeInsets.only(bottom: 10),
                      child:  ContainerCard(
                        containerWidget: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                              Text(
                                 translation(context).feb14,style: const TextStyle(
                                  fontSize: 16,color:Color(0xff0C8A7D)
                                ),),
                                Text(translation(context).low,
                                style: const TextStyle(
                                color:Colors.red,fontSize: 14,),),

                              ],),
                          
                  
                        // margin: EdgeInsets.fromLTRB(0, 1, 5, 9),
                        // alignment: Alignment.topLeft,
                         const Text(
                          " 81",
                          style: TextStyle(color: Colors.black87, fontSize: 22
                          ,),
                        ),
                      
                    ],
                  ),
                ),
              
            ),
        ],  ),
        ),
      ),
    );
  }
}
