import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:user_app/module/doing_exercise.dart';

class Ready extends StatelessWidget {
  const Ready({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter',
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
  int maxRecordTime = 3;

  @override
  void initState() {
    tick();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBar(
              title: const Text(""),
            ),
            Container(
              padding:  EdgeInsets.only(top: 70, bottom: 30),
              child: Image.asset("assets/img/bridge.png"),
            ),
            Container(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: const Text(
                "READY TO GO!",
                style: TextStyle(
                  color: Color.fromRGBO(12, 138, 125, 1),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 35),
              child: const Text(
                "BRIDGE",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Center(child: progressIndicatorWidget()),
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
              4.5,
            ),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              border: Border.fromBorderSide(BorderSide(
                color: Colors.transparent,
                width: 1.5,
              )),
            ),
            child: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.white,
              child: Text(
                "${_timerVideo.value}",
                style: const TextStyle(
                  fontSize: 32,
                  color: Colors.black,
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
        
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => doing_exercise()),
          );
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
    this.borderThickness = 8,
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
