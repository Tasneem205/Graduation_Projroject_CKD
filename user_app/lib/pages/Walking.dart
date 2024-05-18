import 'package:flutter/material.dart';
import 'package:user_app/Classes/language_constants.dart';

class Walking extends StatefulWidget {
  const Walking({Key? key}) : super(key: key);

  @override
  State<Walking> createState() => _WalkingState();
}

class _WalkingState extends State<Walking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F7FD),
// class WalkingScreen extends StatelessWidget {
//   const WalkingScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF2F7FD),
        title: SharedColorText(text: translation(context).walking),
        iconTheme: const IconThemeData(
          color: const Color(0xff0C8A7D),
        ),
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
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
                  SharedText(
                    text: translation(context).thisday,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const SharedColorText(
                    text: "00:00:00",
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SharedText(
                    text: translation(context).noworkouts,
                    fontSize: 10,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //this week Container

            Column(
              children: [
                ListView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: ContainerCard(
                        containerWidget: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SharedText(
                                  text: translation(context).dec17,
                                  fontSize: 16,
                                ),
                                const SharedColorText(
                                  text: "(0.85Km)",
                                  fontSize: 14,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SharedTitleAndValue(
                                      titleText:
                                          translation(context).workoutdurtion,
                                      valueText: '00:11:00',
                                    ),
                                    const SizedBox(
                                      height: 7,
                                    ),
                                    SharedTitleAndValue(
                                      titleText:
                                          translation(context).workoutcalories,
                                      valueText: translation(context).cal,
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SharedTitleAndValue(
                                      titleText: translation(context).avgspeed,
                                      valueText: '4.2 km/h',
                                    ),
                                    const SizedBox(
                                      height: 7,
                                    ),
                                    SharedTitleAndValue(
                                      titleText: translation(context).steps,
                                      valueText: '1.164',
                                    )
                                  ],
                                )
                              ],
                            )
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

  const ContainerCard({
    super.key,
    required this.containerWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 3), // changes position of shadow
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
  const SharedColorText({super.key, required this.text, this.fontSize = 24});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: const Color.fromRGBO(12, 138, 125, 1), fontSize: fontSize),
    );
  }
}

class SharedText extends StatelessWidget {
  final String text;
  final double fontSize;
  const SharedText({super.key, required this.text, this.fontSize = 16});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: fontSize),
    );
  }
}

class SharedTitleAndValue extends StatelessWidget {
  final String titleText;
  final String valueText;

  const SharedTitleAndValue({
    super.key,
    required this.titleText,
    required this.valueText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SharedText(
          text: titleText,
        ),
        const SizedBox(
          height: 5,
        ),
        SharedColorText(
          text: valueText,
          fontSize: 16,
        ),
      ],
    );
  }
}
