import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:user_app/Classes/language_constants.dart';
import 'package:user_app/pages/pages_chat/chat_screen.dart';

class Home_chat_bot extends StatefulWidget {
  static const String routeName = 'home';
  const Home_chat_bot({super.key});

  @override
  State<Home_chat_bot> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Home_chat_bot> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Colors.white,
            Color.fromARGB(255, 156, 188, 188)
          ], // Set your gradient colors here
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 250,
                  height: 150,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        "assets/img/message (1) 1.png",
                        width: 240,
                        height: 150,
                        fit: BoxFit.fill,
                      ),
                       Positioned.fill(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            translation(context).welcome,
                            style: const TextStyle(
                                color: Colors.black,
                                fontFamily: "Cera Pro",
                                fontSize: 40),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 170,
                  child: Image.asset(
                    "assets/img/donation-streaming-media-streamlabs-open-broadcaster-software-twitch-photoshop-software-interface-30fc4d2de67ced50f09661f68036ac91.png",
                    fit: BoxFit.contain,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(0),
                  margin: const EdgeInsets.symmetric(vertical: 30),
                  child:  Text(
                    translation(context).bot,
                    style: const TextStyle(
                        fontFamily: "Cera Pro",
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(0),
                    margin: const EdgeInsets.symmetric(vertical: 30),
                    child: AnimatedTextKit(
                        displayFullTextOnTap: true,
                        isRepeatingAnimation: false,
                        repeatForever: false,
                        animatedTexts: [
                          TyperAnimatedText(
                            translation(context).howmayihelpyou,
                            speed: const Duration(milliseconds: 50),
                            textStyle: const TextStyle(
                                fontFamily: "Cera Pro",
                                fontSize: 28,
                                color: Colors.black),
                          )
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
             onPressed: () 
            async {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return  const ChatScreen();
              }));
            },
          
             backgroundColor: Colors.white,
            tooltip: translation(context).bot,
            child: Image.asset(
              "assets/img/donation-streaming-media-streamlabs-open-broadcaster-software-twitch-photoshop-software-interface-30fc4d2de67ced50f09661f68036ac91.png",
              // scale: Checkbox.width,
            
            )),
      ),
    );
  }
}

