import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:user_app/Classes/language_constants.dart';
import 'package:user_app/module/exercise_details_screen.dart';
import 'package:user_app/module/ready.dart';

class ExerciseScreen extends StatelessWidget {
  const ExerciseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
      slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
            floating: true,
            pinned: true,
            backgroundColor:  const Color(0XFF0C8A7D),
            iconTheme: const IconThemeData(color: Color(0xff0C8A7D), size: 27),
            flexibleSpace: FlexibleSpaceBar(
              title:
              Container(
                 alignment: Alignment.topLeft,
                 margin: const EdgeInsets.only(top: 10),
                child:
                 Text(translation(context).exercises,
                style: TextStyle(fontSize: 20),
              ), 
              ),
               
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/img/exersice_bar.png',
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.6),
                        ],
                      ),
                    ),
                  ),
                   Positioned(
                    bottom: 40.0,
                    left: 20.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        
                        
                        SharedColorText(
                              text: translation(context).exercise,
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(height: 6),
                            Row(
                              
                              children: [
                                SharedColorText(
                              text: translation(context).nworkouts,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(width: 15),
                            SharedColorText(
                              text: translation(context).nminutes,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                              ],
                            ),
                        
                        Text(
                          translation(context).text,
                          style: TextStyle(fontSize: 12, color: Color.fromARGB(185, 0, 0, 0),fontWeight: FontWeight.w100),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(delegate: SliverChildBuilderDelegate((context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (context) => PopScope(
                        canPop: true,
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                          child: AlertDialog(
                            backgroundColor: Colors.white,
                            scrollable: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            content: const ExerciseDetailsScreen(),
                          ),
                        ),
                      ),
                    );
                  },
                  child: ContainerCard(
                    containerWidget: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SharedColorText(
                              text: translation(context).bridge,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            SharedColorText(
                              text: '00:30',
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                            ),
                          ],
                        ),
                        Image.asset(
                          "assets/img/bridge.png",
                          width: 50,
                          height: 50,
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }, childCount: 10)),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10,bottom: 25),
        child: SizedBox(
          width: double.infinity,
          height: 54,
          child: MaterialButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Ready()));
            },
            color: const Color(0XFF0C8A7D),
            height: 54,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Align(
                alignment: AlignmentDirectional.center,
                child:
                 SharedColorText(
                  text: translation(context).start,
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
                
                
              ),
            ),
          ),
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
  final Color? color;
  final FontWeight? fontWeight;

  const SharedColorText(
      {super.key,
      this.color,
      this.fontWeight,
      required this.text,
      this.fontSize = 24});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color ?? const Color(0XFF0C8A7D),
          fontSize: fontSize,
          fontWeight: fontWeight),
    );
  }
}
