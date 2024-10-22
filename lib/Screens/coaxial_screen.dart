import 'package:flutter/material.dart';
import 'package:tline_calculator/Screens/home_screen.dart';
import 'package:tline_calculator/Screens/microstrip_screen.dart';
import 'package:tline_calculator/Screens/parallelplate_screen.dart';
import 'package:tline_calculator/utils/app_styles.dart';
import 'package:tline_calculator/utils/calculator.dart';
import 'package:tline_calculator/widgets/custom_slider.dart';
import 'package:tline_calculator/widgets/custom_textfield.dart';

//COAXIAL TRANSMISSION LINE SCREEN

class CoaxialScreen extends StatefulWidget {
  const CoaxialScreen({super.key});

  @override
  State<CoaxialScreen> createState() => _CoaxialScreen();
}

class _CoaxialScreen extends State<CoaxialScreen> {
  //Variables
  double _currentvalue = 0;
  double _a = 0.5; //Inner Radius
  double _b = 1.0; //Outer Radius
  //String innerradius = '';
  //String outerradius = '';
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
  final TextEditingController erController = TextEditingController();
  final TextEditingController freqController = TextEditingController();

  //Variables that hold user input

  @override
  Widget build(BuildContext context) {
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
                child:
                    Container(width: 500, height: 500, color: Apptheme.darker),
              ), //Box one with container 1
              SizedBox(width: 30, height: 5),
              SizedBox(
                //Contains the First Container
                width: 400,
                height: 400,
                child:
                    Container(width: 500, height: 500, color: Apptheme.darker),
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
                  child: _mainbutton(() => null, 'COAXIAL LINE'),
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

          //ROW 3 with first set of sliders
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                //Showcases the Slider Value of R - Slider 1
                //_currentvalue.toString(),
                "Inner Diameter a: $_a mm ",
                style: TextStyle(fontSize: 20, color: Apptheme.accent),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Slider(
                  value: _a,
                  min: 0,
                  max: 10,
                  divisions: 20,
                  activeColor: Apptheme.accent,
                  thumbColor: Apptheme.accent,
                  inactiveColor: Apptheme.darker,
                  onChanged: (value) {
                    setState(() {
                      _a = value;
                    });
                  },
                ),
              ),
              Text(
                //Showcases the Slider Value of L - Slider 2
                "Outer Diameter: ${_b.toStringAsFixed(3)} mm",
                style: TextStyle(fontSize: 20, color: Apptheme.accent),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Slider(
                  value: _b,
                  min: 0,
                  max: 177,
                  divisions: 177,
                  activeColor: Apptheme.accent,
                  thumbColor: Apptheme.accent,
                  inactiveColor: Apptheme.darker,
                  onChanged: (value) {
                    setState(() {
                      _b = value;
                    });
                  },
                ),
              ),
            ],
          ),
          //THIS ROW HAS IN THE TEXT FIELDS
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
                      hintText: 'ϵ_r',
                      controller: erController),
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
                      z0 = coaxialwirecimp(_epsilonr, _b, _a);
                      //Calculate Admittance (Y)
                      y0 = admittance(z0);
                    });
                  },
                  color: Apptheme.accent,
                  child: Text('CALCULATE'),
                ),
              ),
            ],
          )
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
}
