import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_titled_container/flutter_titled_container.dart';
import 'package:tline_calculator/Screens/coaxial_screen.dart';
import 'package:tline_calculator/Screens/general_screen.dart';
import 'package:tline_calculator/Screens/home_screen.dart';
import 'package:tline_calculator/Screens/parallelplate_screen.dart';
import 'package:tline_calculator/utils/app_styles.dart';
import 'package:tline_calculator/utils/calculator.dart';
import 'package:tline_calculator/widgets/custom_slider.dart';
import 'package:tline_calculator/widgets/custom_textfield.dart';

//MICROSTRIP TRANSMISSION LINE SCREEN

class MicrostripScreen extends StatefulWidget {
  const MicrostripScreen({super.key});

  @override
  State<MicrostripScreen> createState() => _MicrostripScreen();
}

class _MicrostripScreen extends State<MicrostripScreen> {
  //Variables for Sliders
  double _currentvalue = 0;
  String erstring = '';
  double _epsilonr = 0;
  String freqtext = '';
  double _freq = 0.0;
  double w = 0.0;
  String p_constanttext = '';
  double phaseconstant = 0.0;
  double phasevelocity = 0.0;
  double z0 = 0.0;
  double y0 = 0.0;
  double c = 0.0;
  double l = 0.0;
  double h = 0.0;
  double t = 0.0;
  double wd = 0.0;
  String hstring = '';
  String wdstring = '';
  String tstring = '';
  List zvalues = [];
  List<FlSpot> z0Data = [];
  List<FlSpot> y0Data = [];

  final TextEditingController wdController = TextEditingController();
  final TextEditingController hController = TextEditingController();
  final TextEditingController tController = TextEditingController();
  final TextEditingController freqController = TextEditingController();
  final TextEditingController erController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // Calculate min and max for dynamic scaling
    double minX = z0Data.isNotEmpty ? z0Data.first.x : 0;
    double maxX = z0Data.isNotEmpty ? z0Data.last.x : 10;

    // Check if z0Data is not empty before calculating minY and maxY
    double minY = z0Data.isNotEmpty
        ? z0Data.map((e) => e.y).reduce((a, b) => a < b ? a : b)
        : 0; // Default value if empty

    double maxY = z0Data.isNotEmpty
        ? z0Data.map((e) => e.y).reduce((a, b) => a > b ? a : b)
        : 10; // Default value if empty
    return Scaffold(
      backgroundColor: Apptheme.dark,
      body: Column(
        //Main Body Column That Holds Everything Together
        children: [
          SizedBox(
              width: 1000,
              height:
                  30), //Sizedbox creates space between the top of the app and the container
          Row(
            //Top Row of  Containers with Graph, Diagram and Outputs
            children: [
              SizedBox(width: 30, height: 5),
              SizedBox(
                //Contains the First Container
                width: 400,
                height: 400,
                child: Container(
                  width: 500,
                  height: 500,
                  //color: Apptheme.darker,
                  decoration: BoxDecoration(
                      color: Apptheme.darker,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: TitledContainer(
                    title: 'Z0 vs h',
                    textAlign: TextAlignTitledContainer.Center,
                    titleColor: Apptheme.accent,
                    backgroundColor: Colors.transparent,
                    fontSize: 20.0,
                    child: Container(
                        width: 500,
                        height: 500,
                        //color: Apptheme.darker,
                        decoration: BoxDecoration(
                            color: Apptheme.darker,
                            borderRadius: BorderRadius.circular(10.0)),
                        child: LineChart(LineChartData(
                            minX: minX,
                            minY: minY,
                            maxY: maxY,
                            maxX: maxX,
                            gridData: FlGridData(
                              show: true,
                              getDrawingHorizontalLine: (value) {
                                return FlLine(
                                    color: Apptheme.light, strokeWidth: 0.5);
                              },
                              drawVerticalLine: true,
                              getDrawingVerticalLine: (value) {
                                return FlLine(
                                    color: Apptheme.light, strokeWidth: 0.5);
                              },
                            ),
                            lineBarsData: [
                              LineChartBarData(
                                spots: z0Data,
                                isCurved: true,
                                color: Apptheme.accent,
                              ),
                              /*LineChartBarData(
                                spots: y0Data,
                                isCurved: true,
                                color: Apptheme.light,
                              )*/
                            ]))),
                  ),
                ),
              ), //Box one with container 1
              SizedBox(width: 30, height: 5),
              SizedBox(
                //Contains the First Container
                width: 400,
                height: 400,
                child: Container(
                  width: 500,
                  height: 500,
                  //color: Apptheme.darker,
                  decoration: BoxDecoration(
                      color: Apptheme.darker,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: SizedBox(
                      width: 250,
                      height: 250,
                      child: Image.asset('assets/WIRESTRIP_IMAGE.png')),
                ),
              ), //Box one with container 2
              SizedBox(width: 30, height: 5),
              SizedBox(
                //Contains the First Container
                width: 400,
                height: 400,
                child: Container(
                  width: 500,
                  height: 500,
                  //color: Apptheme.darker,
                  decoration: BoxDecoration(
                      color: Apptheme.darker,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //Showcases Frequency
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Frequency: $_freq',
                              style: Apptheme.inputStyle,
                            ),
                          ),
                          //Showcases Angular Frequency (w)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'w: ${w.toStringAsFixed(2)}rad/s',
                              style: Apptheme.inputStyle,
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //Phase Constant
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'β: ${phaseconstant.toStringAsExponential(2)}rad/m',
                              style: Apptheme.inputStyle,
                            ),
                          ),
                          //Phase Velocity (u_p)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'u_p: ${phasevelocity.toStringAsExponential(2)}m/s',
                              style: Apptheme.inputStyle,
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //Characteristic Impedance (Z_0)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Z_0: ${z0.toStringAsFixed(2)}ohm',
                              style: Apptheme.inputStyle,
                            ),
                          ),
                          //Admittance
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Y_0: ${y0.toStringAsExponential(2)}S',
                              style: Apptheme.inputStyle,
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //Coaxial Capacitance per unit length
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'C: ${c.toStringAsExponential(2)}F/mm',
                              style: Apptheme.inputStyle,
                            ),
                          ),
                          //Coaxial Inductance per unit length
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'L: ${l.toStringAsExponential(2)}H/mm',
                              style: Apptheme.inputStyle,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ) //Box one with container 3
            ],
          ), //END OF TOP ROW

          SizedBox(width: 1000, height: 30),

          //ROW 2 WITH TM LINE BUTTONS
          Row(
              mainAxisAlignment: MainAxisAlignment.center, // Center the button
              children: [
                Padding(
                  //Padding for Coaxial Line Button
                  padding: const EdgeInsets.all(
                      8.0), // Add padding around the button
                  child: _mainbutton(
                      () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CoaxialScreen()),
                          ),
                      'COAXIAL LINE'),
                ),
                Padding(
                  //Padding for Two Wire Line Button
                  padding: const EdgeInsets.all(
                      8.0), // Add padding around the button
                  child: _mainbutton(
                      () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()),
                          ),
                      'TWO WIRE LINE'),
                ),
                Padding(
                  //Padding For Parallel Plate Button
                  padding: const EdgeInsets.all(
                      8.0), // Add padding around the button
                  child: _mainbutton(
                      () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ParallelplateScreen()),
                          ),
                      'PARALLEL PLATE LINE'),
                ),
                Padding(
                  //Padding for Air Line Button
                  padding: const EdgeInsets.all(
                      8.0), // Add padding around the button
                  child: _mainbutton(
                      () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GeneralScreen()),
                          ),
                      'GENERAL T LINE'),
                ),
                Padding(
                  //Padding for MicroStrip Line Button
                  padding: const EdgeInsets.all(
                      8.0), // Add padding around the button
                  child: _mainbutton(() => null, 'MICROSTRIP LINE'),
                ),
              ]),

          //ROW 3 with first set of sliders
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 200,
                  height: 80,
                  child: CustomTextfield(
                      maxLength: 5,
                      maxLines: 1,
                      hintText: 'Width - w(mm)',
                      controller: wdController),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 200,
                  height: 80,
                  child: CustomTextfield(
                      maxLength: 5,
                      maxLines: 1,
                      hintText: 'Height - h(mm)',
                      controller: hController),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 200,
                  height: 80,
                  child: CustomTextfield(
                      maxLength: 5,
                      maxLines: 1,
                      hintText: 'Trace - t(mm)',
                      controller: tController),
                ),
              ),
            ],
          ),
          //ROW 4 WITH SECOND SET OF SLIDERS
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 200,
                height: 55,
                child: CustomTextfield(
                    maxLength: 5,
                    maxLines: 1,
                    hintText: 'ϵ_r',
                    controller: erController),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 200,
                height: 55,
                child: CustomTextfield(
                    maxLength: 5,
                    maxLines: 1,
                    hintText: 'Frequency (Hz)',
                    controller: freqController),
              ),
            ),
            Padding(
              //Padding for Two Wire Line Button
              padding:
                  const EdgeInsets.all(8.0), // Add padding around the button
              child: MaterialButton(
                onPressed: () {
                  setState(() {
                    //Gets Values in Text Boxes
                    hstring = hController.text;
                    h = double.tryParse(hstring) ?? 0.0;
                    tstring = tController.text;
                    t = double.tryParse(tstring) ?? 0.0;
                    wdstring = wdController.text;
                    wd = double.tryParse(wdstring) ?? 0.0;
                    //Calculates Frequency and Angular Frequency
                    freqtext = freqController.text;
                    _freq = double.tryParse(freqtext) ?? 0.0;
                    w = afrequency(_freq);
                    //Calculates Beta (Phase Constant)
                    erstring = erController.text;
                    _epsilonr = double.tryParse(erstring) ?? 0.0;
                    phaseconstant = pconstant(_freq, _epsilonr);
                    //Calculates Phase Velocity
                    phasevelocity = pvelocity(_epsilonr);
                    //Calculate Characteristic Impedance
                    z0 = microstriplineimp(h, t, wd, _epsilonr);
                    zvalues = [z0];
                    //Calculate Admittance (Y)
                    y0 = admittance(z0);
                    //Calculate Capacitance per unit length C
                    c = microcap(h, t, wd, _epsilonr);
                    //Calculate Inductance per unit length L
                    l = microind(wd, t);
                    //Add current Values to list of points
                    //z0Data.add(FlSpot(_b, z0));
                    //y0Data.add(FlSpot(_b, y0));
                    _addDataPoint(h, z0, y0);
                  });
                },
                color: Apptheme.accent,
                child: Text('CALCULATE'),
              ),
            ),
            Padding(
              //Padding for Two Wire Line Button
              padding:
                  const EdgeInsets.all(8.0), // Add padding around the button
              child: MaterialButton(
                onPressed: () {
                  setState(() {
                    //Clear Graph Numbers
                    z0Data.clear();
                    y0Data.clear();
                    //z0Data.add(FlSpot(0, 0));
                    //y0Data.add(FlSpot(0, 0));
                  });
                },
                color: Apptheme.accent,
                child: Text('CLEAR GRAPH'),
              ),
            ),
          ])
        ],
      ),
    );
  }

  //A button method that can be reused multiple times
  ElevatedButton _mainbutton(Function()? onPressed, String text) {
    return ElevatedButton(
        onPressed: onPressed, style: _buttonStyle(), child: Text(text));
  }

  ButtonStyle _buttonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: Apptheme.accent,
      foregroundColor: Apptheme.darker,
      elevation: 5.0,
      fixedSize: Size(200, 50),
    );
  }

  //Sorts graph points
  void _addDataPoint(double b, double z0, double y0) {
    z0Data.add(FlSpot(b, z0));
    y0Data.add(FlSpot(b, y0));

    // Sort data points by x-value
    z0Data.sort((a, b) => a.x.compareTo(b.x));
    y0Data.sort((a, b) => a.x.compareTo(b.x));
  }
}
