import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:user_app/Classes/language_constants.dart';

class Water extends StatefulWidget {
  const Water({super.key});
  @override
  State<Water> createState() => WaterState();
}

class WaterState extends State<Water> with TickerProviderStateMixin{
  int i = 0;
  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Chartdata> chartData = <Chartdata>[
      Chartdata('Sat', 1000),
      Chartdata('Sun', 2000),
      Chartdata('Mon', 400),
      Chartdata('Tue', 200),
      Chartdata('Wed', 800),
      Chartdata('Thu', 1000),
      Chartdata('Fri', 1500),
    ];
    return Scaffold(
      key: scaffoldkey,
      appBar: AppBar(
          centerTitle: true,
          title: Row(
            children: [
              Image.asset("images/target.png", width: 24),
              Text(translation(context).target,
                  style: const TextStyle(
                      color: Color(0xff0593FC),
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                      letterSpacing: -0.45,
                      height: 18)),
            ],
          ),
          backgroundColor: const Color(0xffF2F7FD),
          elevation: 0.0,
          iconTheme: const IconThemeData(color: Color(0xff0593FC))),
      body: Stack(children: [
        Expanded(child: Container(color: const Color(0xffF2F7FD))),
        Expanded(
          child: Positioned(
            top: 20,
            right: 10,
            left: 10,
            child:
                Image.asset("images/quality.png", alignment: Alignment.center),
          ),
        ),
        Positioned(
          left: 130,
          top: 233,
          child: Text(
            "$i ml",
            style: const TextStyle(
                color: Color(0xffFFFFFF),
                fontSize: 28,
                fontWeight: FontWeight.normal,
                letterSpacing: -0.45),
          ),
        ),
        Expanded(
          child: Positioned(
            top: 352,
            bottom: 40,
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Opacity(
                  opacity: _animation.value,
                  child: SfCartesianChart(
                    primaryXAxis: const CategoryAxis(),
                    series: <CartesianSeries>[
                      // Render column series
                      ColumnSeries<Chartdata, String>(
                          dataSource: chartData,
                          xValueMapper: (Chartdata data, _) => data.x,
                          yValueMapper: (Chartdata data, _) => data.y,
                          color: const Color(0xffB3DAFE)),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
        Positioned(
            top: 81,
            left: 182,
            child: Container(
                width: 105,
                height: 105,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(55),
                    color: const Color(0xffFFFFFF)))),
        Positioned(
          top: 78,
          left: 178,
          child: IconButton(
            icon: const Icon(Icons.add),
            color: const Color(0xff0593FC),
            iconSize: 100,
            onPressed: () {
              scaffoldkey.currentState!.showBottomSheet(
                (context) => Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color(0xffFFFFFF),
                        borderRadius: BorderRadius.circular(15)),
                    margin: const EdgeInsets.only(bottom: 5, left: 4, right: 4),
                    padding: const EdgeInsets.only(top: 10),
                    height: 300,
                    child: Column(children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 18),
                        width: double.infinity,
                        child: Column(children: [
                          Image.asset("images/water.png", height: 140),
                           Text(translation(context).water,
                              style: const TextStyle(
                                  color: Color(0xff000000),
                                  fontSize: 20,
                                  letterSpacing: -0.45)),
                        ]),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            MaterialButton(
                                color: const Color(0xffB9DFFF),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                child: const Text("50ml",
                                    style: TextStyle(
                                        color: Color(0xff000000),
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                        letterSpacing: -0.45),
                                    textAlign: TextAlign.center),
                                onPressed: () {
                                  setState(() {
                                    if (i < 2000) {
                                      i = i + 50;
                                    }
                                  });
                                }),
                            MaterialButton(
                                color: const Color(0xffB9DFFF),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                child: const Text("100ml",
                                    style: TextStyle(
                                        color: Color(0xff000000),
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                        letterSpacing: -0.45),
                                    textAlign: TextAlign.center),
                                onPressed: () {
                                  setState(() {
                                    if (i < 2000) {
                                      i = i + 100;
                                    }
                                  });
                                }),
                            MaterialButton(
                                color: const Color(0xffB9DFFF),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                child: const Text("150ml",
                                    style: TextStyle(
                                        color: Color(0xff000000),
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                        letterSpacing: -0.45),
                                    textAlign: TextAlign.center),
                                onPressed: () {
                                  setState(() {
                                    if (i < 2000) {
                                      i = i + 150;
                                    }
                                  });
                                }),
                          ]),
                      MaterialButton(
                        color: const Color(0xffB9DFFF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                        child: const Icon(
                          Icons.restart_alt_rounded, 
                          size: 30, 
                          color: Color(0xffFFFFFF)),
                        onPressed: () {
                          setState(() {
                            i = 0;
                          });
                        },
                      ),
                    ]),
                  ),
                ),
              );
            },
          ),
        ),
      ]),
    );
  }
}

class Chartdata {
  Chartdata(this.x, this.y);
  final String x;
  final double y;
}
