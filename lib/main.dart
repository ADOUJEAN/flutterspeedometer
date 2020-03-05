import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double position= 45.7; // Pointer default position

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(widget.title),
      ),

      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            customSfRadialGauge()
          ],
        ),
      ),
    );
  }

  SfRadialGauge customSfRadialGauge() {
    return SfRadialGauge(
      axes: <RadialAxis>[
        RadialAxis(
          startAngle: -230,
          endAngle: 50,
          labelFormat: '',
          axisLineStyle: AxisLineStyle(

              gradient: SweepGradient(
                startAngle: 0.0, endAngle: 100.7,
                colors: const<Color>[Colors.red,Colors.white],),
              thicknessUnit: GaugeSizeUnit.factor,thickness: 0.01),
          majorTickStyle: MajorTickStyle(length: 0,thickness: 4,color: Colors.black),
          minorTickStyle: MinorTickStyle(length: 0,thickness: 3,color: Colors.black),
          axisLabelStyle: GaugeTextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 14 ),
        ),

        RadialAxis(
            radiusFactor: 0.8,
            minimum: 0,
            maximum: 150,
            interval: 10,

            majorTickStyle: MajorTickStyle(length: 6,thickness: 4,color: Colors.red),
            minorTickStyle: MinorTickStyle(length: 0,thickness: 3,color: Colors.black),
            axisLabelStyle: GaugeTextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14 ),
            ranges: <GaugeRange>[
              GaugeRange(startValue: 0, endValue: 150, color: Colors.white),  // Principal Gauge range
              GaugeRange(startValue: 0, endValue: position, color: Colors.red),  // Second Gauge range used to indicate position

            ],
            pointers: <GaugePointer>[

              NeedlePointer(
                  value: position, enableAnimation: true, needleColor: Colors.red)
            ],
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                  widget: Column(
                    children: <Widget>[
                      Text(
                        position.toString(),
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold,fontSize: 40),
                      ),
                      Text(
                        "Mb/s",
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold,fontSize: 20),
                      ),
                    ],
                  ),
                  positionFactor: 0.5,
                  angle: 90)
            ])
      ],
    );
  }

}
