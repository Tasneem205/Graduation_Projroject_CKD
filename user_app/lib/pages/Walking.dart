import 'package:flutter/material.dart';

class Walking extends StatefulWidget {
  const Walking({Key? key}) : super(key: key);

  @override
  State<Walking> createState() => _WalkingState();
}

class _WalkingState extends State<Walking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  


// class WalkingScreen extends StatelessWidget {
//   const WalkingScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
      appBar: AppBar(
        title: const SharedColorText(text:  "Walking",),
      ),
      body:SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
          const  SizedBox(height: 10,),
            //this week Container
            const ContainerCard(
              containerWidget: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SharedText(
                    text: 'This Day',
                  ),
                  SizedBox(height: 5,),
                  SharedColorText(text:  "00:00:00",),
                  SizedBox(height: 5,),
                  SharedText(text: "no workouts",fontSize: 10,),

                ],


              ),
            ),
            const    SizedBox(height: 20,),
            //this week Container

            Column(
              children: [
                ListView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  physics:const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return const Padding(
                      padding:  EdgeInsets.only(bottom: 10),
                      child:  ContainerCard(
                        containerWidget: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SharedText(
                                  text: 'Dec 17',
                                  fontSize: 16,
                                ),
                                SharedColorText(text:  "(0.85Km)",fontSize: 14,),

                              ],
                            ),
                            SizedBox(height: 7,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   SharedTitleAndValue(
                                     titleText: 'Workout durtion',
                                     valueText: '00:11:00',
                                   ),
                                   SizedBox(height: 7,),
                                   SharedTitleAndValue(
                                     titleText: 'Workout calories',
                                     valueText:  '46 cal',
                                   ),


                                 ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SharedTitleAndValue(
                                    titleText: 'Avg.Speed',
                                    valueText: '4.2 km/h',
                                  ),
                                  SizedBox(height: 7,),
                        SharedTitleAndValue(
                                  titleText: 'Steps',
                                  valueText: '1.164',
                      )

                                ],
                              )
                            ],)

                          ],


                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            // ListView.builder(itemBuilder: itemBuilder)

          ],
        ),
      ),
    );
  }
}
class ContainerCard extends StatelessWidget {
  final Widget containerWidget;

  const ContainerCard(
      {super.key,
        required this.containerWidget,
       });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color:  Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              spreadRadius: 1,
              blurRadius: 3,
              offset:const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: containerWidget,
        ),
      ),
    );
  }
}
class SharedColorText extends StatelessWidget {
  final String text;
  final double fontSize;
  const SharedColorText({super.key,required this.text,this.fontSize=24});

  @override
  Widget build(BuildContext context) {
    return  Text(
      text,
      style: TextStyle(color: const Color.fromRGBO(12, 138, 125, 1),fontSize: fontSize),
    );
  }
}
class SharedText extends StatelessWidget {
  final String text;
  final double fontSize;
  const SharedText({super.key,required this.text,this.fontSize=16});

  @override
  Widget build(BuildContext context) {
    return  Text(
      text,
      style: TextStyle(fontSize: fontSize),
    );
  }
}
class SharedTitleAndValue extends StatelessWidget {
  final String titleText;
  final String valueText;

  const SharedTitleAndValue({super.key,
    required this.titleText,
    required this.valueText,
  });

  @override
  Widget build(BuildContext context) {
    return   Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SharedText(
          text: titleText,
        ),
        const  SizedBox(height: 5,),
        SharedColorText(text:  valueText,fontSize: 16,),

      ],
    );
  }
}

