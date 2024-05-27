import 'dart:async';
import 'dart:math' as math;
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:user_app/module/doing_exercise.dart';


class Rest extends StatelessWidget {
  const Rest({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rest',
      home: GradientCircularProgressIndicator(),
    );
  }
}

class GradientCircularProgressIndicator extends StatefulWidget {
  const GradientCircularProgressIndicator({super.key});

  @override
  State<GradientCircularProgressIndicator> createState() =>
      _GradientCircularProgressIndicatorState();
}

class _GradientCircularProgressIndicatorState
    extends State<GradientCircularProgressIndicator> {
  final ValueNotifier<int> _timerVideo = ValueNotifier<int>(0);
  int maxRecordTime = 30;
  bool showPlus20Button = true;

  @override
  void initState() {
    tick();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
    
      
       SingleChildScrollView(
         child: Column(
                
                children: [
                  
                  
                        Stack(
                          
                    children: [
                      // blur image
                      Container(
                        height: 400,
                        width: double.maxFinite,
                        child: 
                        ClipRRect(
                        child: ImageFiltered(
                          imageFilter: ImageFilter.blur(sigmaX: 2,sigmaY: 2),
                          child: Image.asset("assets/img/1109-drinking-water2.png",fit:BoxFit.cover,),
                        ),
                      )
                        ,
         
                      ),
                      
                        const Center(
                          heightFactor: 7,
                          child: 
                          Text("TAKE A REST",style: TextStyle(color: Color.fromRGBO(12, 135, 125, 1),fontWeight: FontWeight.bold, fontSize: 24),),
                        
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 170),
                          child: 
                          Row(  
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,                    
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 10),
                            
                              child: Visibility(
                                  visible: showPlus20Button, // Set visibility based on boolean flag
                                  child: MaterialButton(
                                    onPressed: () {
                                      setState(() {
                                      maxRecordTime = 50;
                                      showPlus20Button = false; // Hide the button after it's pressed
                                      });
                                    },
                                  color: const Color(0xffC3DADD),
                                  height: 30,
                                  shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  ),
                              child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Align(
                              alignment: AlignmentDirectional.center,
                                child: Text(
                                            "+20",
                                            style: TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                            
                            
                            Container(
                              margin:const EdgeInsets.only(left: 40,right: 40,),
                              child: 
                              
                                Center(child: progressIndicatorWidget()),
                            )
                          ,
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child:
                              MaterialButton(
                                        onPressed: () {
                                          Navigator.of(context).push(MaterialPageRoute(
                                          builder: (context) => doing_exercise()));
                                        },
                                        color: const Color(0xffC3DADD),
                                        height: 30,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(25),
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: Align(
                                            alignment: AlignmentDirectional.center,
                                            child:
                                                    Text("Skip",style: TextStyle(color: Colors.white),)
                          
                                                      ),
                                                    ),
                            )
                          
                          ),
                          
                          ],
                          
                        )
                        
                        )
                    
                    ],
                  ),
                    
                
                  
                  Container(
                    padding:const EdgeInsets.only(left: 16,top: 25),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight:Radius.circular(50))
                    ),
                    child: 
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("NEXT",style: TextStyle(color: Color.fromARGB(141, 12, 135, 125),fontWeight: FontWeight.bold)),
                        const Text("2/10 CRUNCHES 00:30",style: TextStyle(color: Color(0xFF0C877D),fontWeight: FontWeight.bold)),
                        Container(
                          margin: const EdgeInsets.only(top: 50),
                          child:
                          Image.asset("assets/img/sports-woman-doing-crunches-exercise-uaypxflc7uj1yt5x.gif"),
                        )
                        
                      ],
                    )
                    
                    
                  ),
                     
                ],
              
              ),
       ),
            
    
    );
  }

  Widget progressIndicatorWidget() {
    return ValueListenableBuilder(
      valueListenable: _timerVideo,
      builder: (BuildContext context, int values, Widget? child) {
        double? per = (double.parse((values / maxRecordTime).toString()));
        return CustomPaint(
          painter: CircularPaint(
            progressValue: per,
          ),
          child: Container(
            padding: const EdgeInsets.all(
              1.5,
            ),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              border: Border.fromBorderSide(BorderSide(
                color: Colors.transparent,
                width: 1,
              )),
            ),
            child: CircleAvatar(
              radius: 30,
              backgroundColor: Color.fromARGB(73, 255, 255, 255),
              child: Text(
                "${_timerVideo.value}",
                style: const TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void tick() {
    Timer.periodic(const Duration(seconds: 1), (Timer t) {
      if (_timerVideo.value != maxRecordTime) {
        _timerVideo.value = _timerVideo.value + 1;
      } else {
        t.cancel();
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => doing_exercise()));
      
      }
    });
  }
}

double deg2rad(double deg) => deg * math.pi / 180;

class CircularPaint extends CustomPainter {
  /// ring/border thickness, default  it will be 8px [borderThickness].
  final double borderThickness;
  final double progressValue;

  CircularPaint({
    this.borderThickness = 3.5,
    required this.progressValue,
  });
  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);

    final rect =
        Rect.fromCenter(center: center, width: size.width, height: size.height);

    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = borderThickness;

    //grey background
    canvas.drawArc(
      rect,
      deg2rad(0),
      deg2rad(360),
      false,
      paint,
    );

    Paint progressBarPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = borderThickness
      ..shader = const LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          Color(0xffC3DADD),
          Color(0xff096B61),
        ],
      ).createShader(rect);
    canvas.drawArc(
      rect,
      deg2rad(-90),
      deg2rad(360 * progressValue),
      false,
      progressBarPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
