import 'package:flutter/material.dart';
import 'package:flutter_titled_container/flutter_titled_container.dart';
import 'package:tline_calculator/Screens/coaxial_screen.dart';
import 'package:tline_calculator/Screens/microstrip_screen.dart';
import 'package:tline_calculator/Screens/parallelplate_screen.dart';
import 'package:tline_calculator/utils/app_styles.dart';
import 'package:tline_calculator/utils/calculator.dart';
import 'package:tline_calculator/widgets/custom_slider.dart';
import 'package:tline_calculator/widgets/custom_textfield.dart';
import 'package:fl_chart/fl_chart.dart';

//import 'package:flutter_titled_container/flutter_titled_container.dart';

//DEFAULT HOME SCREEN IS TWO WIRE TRANSMISSION LINE

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //Variables for Two Wire Line Sliders
  double _currentvalue = 0;
  final TextEditingController d1Controller = TextEditingController();
  final TextEditingController d2Controller = TextEditingController();
  final TextEditingController dController = TextEditingController();
  final TextEditingController freqController = TextEditingController();
  final TextEditingController erController = TextEditingController();
  final TextEditingController muController = TextEditingController();
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
  List zvalues = [];
  List<FlSpot> z0Data = [];
  List<FlSpot> y0Data = [];
  double d1 = 0.0;
  double d2 = 0.0;
  double D = 0.0;
  String d1string = '';
  String Dstring = '';
  String mustring = '';
  double mu_r = 0.0;

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
    /////////////////////////////////////

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
                  color: Apptheme.darker,
                  child: TitledContainer(
                    title: 'Z0 vs D(mm)',
                    textAlign: TextAlignTitledContainer.Center,
                    titleColor: Apptheme.accent,
                    backgroundColor: Colors.transparent,
                    fontSize: 20.0,
                    child: Container(
                        width: 500,
                        height: 500,
                        color: Apptheme.darker,
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
                              LineChartBarData(
                                spots: y0Data,
                                isCurved: true,
                                color: Apptheme.light,
                              )
                            ]))),
                  ),
                ),
              ), //Box one with container 1
              SizedBox(width: 30, height: 5),
              SizedBox(
                //Contains the Second Container
                width: 400,
                height: 400,
                child: Container(
                  width: 500,
                  height: 500,
                  color: Apptheme.darker,
                  child: Image.asset('assets/TWOWIRE_IMAGE.png'),
                ),
              ), //Box one with container 2
              SizedBox(width: 30, height: 5),
              SizedBox(
                //Contains the Third Container
                width: 400,
                height: 400,
                child: Container(
                  width: 500,
                  height: 500,
                  color: Apptheme.darker,
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
                              'C: ${c.toStringAsExponential(2)}F/m',
                              style: Apptheme.inputStyle,
                            ),
                          ),
                          //Coaxial Inductance per unit length
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'L: ${l.toStringAsExponential(2)}H/m',
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
                  child: _mainbutton(() => null, 'TWO WIRE LINE'),
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
                  child: _mainbutton(() => null, 'AIR LINE'),
                ),
                Padding(
                  //Padding for MicroStrip Line Button
                  padding: const EdgeInsets.all(
                      8.0), // Add padding around the button
                  child: _mainbutton(
                      () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MicrostripScreen()),
                          ),
                      'MICROSTRIP LINE'),
                ),
              ]),

          //ROW 3 with first set of text fields d1, d2, D
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                //Text Field for Diameter of wire 1
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 200,
                  height: 80,
                  child: CustomTextfield(
                      maxLength: 5,
                      maxLines: 1,
                      hintText: 'd1 (mm)',
                      controller: d1Controller),
                ),
              ),
              Padding(
                //Text Field for Distance between the two wires
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 200,
                  height: 80,
                  child: CustomTextfield(
                      maxLength: 5,
                      maxLines: 1,
                      hintText: 'D(mm)',
                      controller: dController),
                ),
              )
            ],
          ),
          //ROW 4 WITH SECOND SET OF TEXTFIELDS
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              //Text Field for epsilon_r
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 200,
                height: 55,
                child: CustomTextfield(
                    maxLength: 5,
                    maxLines: 1,
                    hintText: 'er',
                    controller: erController),
              ),
            ),
            Padding(
              //Text Field for Frequency
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
              //Text Field for mu (permeability of material surrounding the two wires)
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 200,
                height: 55,
                child: CustomTextfield(
                    maxLength: 5,
                    maxLines: 1,
                    hintText: 'μ',
                    controller: muController),
              ),
            ),
            Padding(
              //Padding for Two Wire Line Button
              padding:
                  const EdgeInsets.all(8.0), // Add padding around the button
              child: MaterialButton(
                onPressed: () {
                  setState(() {
                    //Gets Input Values for Diameter and Distance between two wires
                    d1string = d1Controller.text;
                    d1 = double.tryParse(d1string) ?? 0.0;
                    Dstring = dController.text;
                    D = double.tryParse(Dstring) ?? 0.0;
                    mustring = muController.text;
                    mu_r = double.tryParse(mustring) ?? 0.0;

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
                    //Calculate Characteristic Impedance for two wire
                    z0 = twowirecimp(_epsilonr, D, d1);
                    zvalues = [z0];
                    //Calculate Admittance (Y)
                    y0 = admittance(z0);
                    //Calculate Capacitance per unit length C
                    c = twocap(D, d1, _epsilonr);
                    //Calculate Inductance per unit length L
                    l = twoind(mu_r, D, d1);
                    //Add current Values to list of points
                    z0Data.add(FlSpot(D, z0));
                    y0Data.add(FlSpot(D, y0));
                    _addDataPoint(D, z0, y0);
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
