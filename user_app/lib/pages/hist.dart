import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:user_app/Classes/language_constants.dart';

class Hist extends StatefulWidget {
  const Hist({Key? key}) : super(key: key);

  @override
  State<Hist> createState() => _HistState();
}

class _HistState extends State<Hist> {
  late List<_ChartData> data;
  
  // late TooltipBehavior _tooltip;

  @override
  void initState() {
    data = [
      _ChartData('Sun', 1000),
      _ChartData('Mon', 2000),
      _ChartData('Tue', 1800),
      _ChartData('Wed', 1900),
      _ChartData('Thurs', 1500),
      _ChartData('Fri', 1700),
      _ChartData('Sat', 2000),
    ];
  
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Chartdata> chartData = <Chartdata>[
      Chartdata('Sun', 220, 100),
      Chartdata('Mon', 120, 120),
      Chartdata('Tue', 140, 90),
      Chartdata('Wed', 100, 60),
      Chartdata('Thurs',150, 70),
      Chartdata('Fri', 140, 100),
      Chartdata('Sat', 170, 110),
    ];
      final List<Color> color = <Color>[];
        color.add(  Colors.pink[50]!);
        color.add(Colors.pink[100]!);
        color.add(Colors.pink[200]!);

        final List<double> stops = <double>[];
        stops.add(0.0);
        stops.add(0.5);
        stops.add(1.0);

        final LinearGradient gradientColors =
            LinearGradient(colors: color, stops: stops);  
        

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
      
          
        title: Text(
          translation(context).history,
          style: TextStyle(color: Color(0xFF0E725B), fontSize: 27),
        ),
        
        iconTheme: const IconThemeData(color: Color(0xff0C8A7D), size: 27)),
      body: Expanded(
        child: SingleChildScrollView(
          child: 
          Center(
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        
                        child: Column(
                          children: [
                              Row(
                              children: [
                                  
                            Text(
                              translation(context).water,
                              style: TextStyle(fontSize: 24),
                            ),
                                Image.asset(
                                "assets/img/Water.png",
                                width: 50,
                                height: 50,
                                //fit: BoxFit.fill,
                                ),
                              
                          ],),
                            SfCartesianChart(
                                legend: Legend(
            toggleSeriesVisibility: true,
            isVisible: true,
            iconHeight: 20,
            iconWidth: 20,
            overflowMode: LegendItemOverflowMode.wrap),
                                primaryXAxis: CategoryAxis ( ),
                                
                                series: <CartesianSeries>[
                                  // Render column series
                                  ColumnSeries<_ChartData, String>(
                                    name: translation(context).water,
                                    
                                    dataSource:  data,
                                    dataLabelSettings: DataLabelSettings(isVisible: false
                                    ),
                                    
                                    xValueMapper: (_ChartData data, _) => data.x,
                                    yValueMapper: (_ChartData data, _) => data.y,
                                    color: Color.fromARGB(231, 179, 218, 254),
                                       borderRadius: BorderRadius.all(Radius.circular(15))
                                  ),
                                ])
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                      
                      
                        child: Column(
                          children: [
                            
                            Row(
                              children: [
                                  
                            Text(
                              translation(context).diabetes,
                              style: TextStyle(fontSize: 24),
                            ),
                                Image.asset(
                                "assets/img/diabetes.png",
                                width: 20,
                                height: 29,
                                fit: BoxFit.fill,
                                ),
                              
                          ],),
                            SfCartesianChart(
            
                            
                              
                                legend: Legend(
            toggleSeriesVisibility: false,
            isVisible: true,
            iconHeight: 20,
            iconWidth: 20,
            
            overflowMode: LegendItemOverflowMode.wrap),
                                primaryXAxis: CategoryAxis(
                                
                                ),
                                series: <CartesianSeries>[
                                  
                                  SplineSeries<CharttData, String>(
                                    name: translation(context).diabetes,
                                  legendIconType: LegendIconType.seriesType,
                                      dataSource: [
                                        CharttData('Sun', 120,
                                            Color.fromARGB(255, 31, 111, 177)),
                                        CharttData('Mon', 200,
                                            Color.fromARGB(255, 31, 111, 177)),
                                        CharttData('Tue', 150,
                                            Color.fromARGB(255, 31, 111, 177)),
                                        CharttData('Wed', 160,
                                            Color.fromARGB(255, 31, 111, 177)),
                                        CharttData('Thurs', 250,
                                            Color.fromARGB(255, 31, 111, 177)),
                                        CharttData('Fri', 200,
                                            Color.fromARGB(255, 31, 111, 177)),
                                        CharttData('Sat', 550,
                                            Color.fromARGB(255, 31, 111, 177)),
                                      ],
                                      // Bind the color for all the data points from the data source
                                      pointColorMapper: (CharttData data, _) =>
                                          data.color,
                                      xValueMapper: (CharttData data, _) =>
                                          data.x,
                                      yValueMapper: (CharttData data, _) =>
                                          data.y,
                                            markerSettings: const MarkerSettings(
                                        isVisible: true,
                                          height: 5, width: 5),),
                                ])
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                      
                        
                        child: Center(
                          child: Column(
                            children: [
                                Row(
                                children: [
                                    
                              Text(
                                translation(context).walking,
                                style: TextStyle(fontSize: 24),
                              ),
                                  Image.asset(
                                  "assets/img/Walking.png",
                                  width: 40,
                                  height: 40,
                                  fit: BoxFit.fill,
                                  ),
                                
                            ],),
                              SfCartesianChart(
                                  legend: Legend(
                              toggleSeriesVisibility: false,
                              isVisible: true,
                              iconHeight: 20,
                              iconWidth: 20,
                              overflowMode: LegendItemOverflowMode.wrap),
                                  primaryXAxis: CategoryAxis(),
                                  series: <CartesianSeries>[
                                    // Render column series
                                    ColumnSeries<_ChartData, String>(
                                      dataSource:  data,
                                      name: translation(context).walking,
                                      xValueMapper: (_ChartData data, _) => data.x,
                                      yValueMapper: (_ChartData data, _) => data.y,
                                      color: Color.fromARGB(222, 229, 194, 79),
                                         borderRadius: BorderRadius.all(Radius.circular(15))
                                    ),
                                  ]),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                      
                      
                        child: Center(
                          child: Column(
                            children: [
                                Row(
                                children: [
                                    
                              Text(
                                translation(context).exercises,
                                style: TextStyle(fontSize: 24),
                              ),
                                  Image.asset(
                                  "assets/img/Gymnastics Skin Type 1.png",
                                  width: 40,
                                  height: 60,
                                  fit: BoxFit.fill,
                                  ),
                                
                            ],),
                              SfCartesianChart(
                                  legend: Legend(
                              toggleSeriesVisibility: false,
                              isVisible: true,
                              iconHeight: 20,
                              iconWidth: 20,
                              overflowMode: LegendItemOverflowMode.wrap),
                                  primaryXAxis: CategoryAxis(),
                                  primaryYAxis: NumericAxis(
                                    ),
                                  // tooltipBehavior: _tooltip,
                                  series: <CartesianSeries<_ChartData, String>>[
                                    AreaSeries<_ChartData, String>(
                                        dataSource: data,
                                        xValueMapper: (_ChartData data, _) =>
                                            data.x,
                                        yValueMapper: (_ChartData data, _) =>
                                            data.y,
                                            name: translation(context).exercises,
                                       gradient: gradientColors,
                                         
                                         ),
                                        
                                  ])
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        alignment: Alignment.center,
                        
                      
                        child: Center(
                          child: Column(
                            children: [
                                Row(
                                children: [
                                    
                              Text(
                                translation(context).pressure,
                                style: TextStyle(fontSize: 24),
                              ),
                                  Image.asset(
                                  "assets/img/Tonometer.png",
                                  width: 40,
                                  height: 60,
                                  fit: BoxFit.fill,
                                  ),
                                
                            ],),
                              Container(
                                margin: EdgeInsets.only(bottom: 40),
                                child: SfCartesianChart(
                                    legend: Legend(
                                toggleSeriesVisibility: false,
                                isVisible: true,
                                iconHeight: 15,
                                 iconWidth: 15,
                                //  image: const AssetImage("assetName"),
                                overflowMode: LegendItemOverflowMode.wrap),
                                    primaryXAxis: CategoryAxis(
                                      
                                    ),
                                    series: <CartesianSeries>[
                                      ColumnSeries<Chartdata, String>(
                                        dataSource: chartData,
                                        name: translation(context).high,
                                        xValueMapper: (Chartdata data, _) => data.x,
                                        yValueMapper: (Chartdata data, _) => data.y,
                                        color: Color.fromARGB(231, 179, 218, 254),
                                           borderRadius: BorderRadius.all(Radius.circular(15))
                                      ),
                                      ColumnSeries<Chartdata, String>(
                                        name: translation(context).low,
                                          dataSource: chartData,
                                          xValueMapper: (Chartdata data, _) => data.x,
                                          yValueMapper: (Chartdata data, _) =>
                                              data.y2,
                                          color: Colors.pink[100],
                                        
                                                 borderRadius: BorderRadius.all(Radius.circular(15))
                                          ),
                                    ]),
                              )
                              
                              // child: SfCartesianChart(
                              //   primaryXAxis: CategoryAxis(),
                              //   series: <CartesianSeries>[
                              //     SplineSeries<ChartSampleData, String>(
                              //       dataSource: lineData,
                              //       xValueMapper: (ChartSampleData sales, _) =>
                              //           sales.x as String,
                              //       yValueMapper: (ChartSampleData sales, _) => sales.y1,
                              //       markerSettings: const MarkerSettings(isVisible: true),
                              //       name: 'High',
                              //     ),
                              //     SplineSeries<ChartSampleData, String>(
                              //       dataSource: lineData,
                              //       name: 'Low',
                              //       markerSettings: const MarkerSettings(isVisible: true),
                              //       xValueMapper: (ChartSampleData sales, _) =>
                              //           sales.x as String,
                              //       yValueMapper: (ChartSampleData sales, _) => sales.y2,
                              //     )
                              //   ],
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CharttData {
  CharttData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
  
}

class Chartdata {
  Chartdata(this.x, this.y, this.y2);
  final String x;
  final double y;
  final double y2;
}

