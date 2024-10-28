import 'package:flutter/material.dart';
import 'package:tline_calculator/Screens/home_screen.dart';
import 'package:tline_calculator/Screens/microstrip_screen.dart';
import 'package:tline_calculator/Screens/parallelplate_screen.dart';
import 'package:tline_calculator/utils/app_styles.dart';
import 'package:tline_calculator/utils/calculator.dart';
import 'package:tline_calculator/widgets/custom_textfield.dart';

class GeneralScreen extends StatefulWidget {
  const GeneralScreen({super.key});

  @override
  State<GeneralScreen> createState() => _GeneralScreenState();
}

class _GeneralScreenState extends State<GeneralScreen> {
  //Variables and initializations
  String erstring = '';
  double _epsilonr = 0;
  String freqtext = '';
  double _freq = 0.0;
  double w = 0.0;
  String p_constanttext = '';
  double phaseconstant = 0.0;
  double phasevelocity = 0.0;
  final TextEditingController erController = TextEditingController();
  final TextEditingController freqController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Apptheme.dark,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            //BIG BAD ROW 1, THE ROW OF COLUMNS
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      //Main Left Column
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 200,
                            height: 80,
                            child: CustomTextfield(
                                maxLength: 5,
                                maxLines: 1,
                                hintText: 'Resistance - R(ohms)',
                                controller: freqController),
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
                                hintText: 'Inductance - L (H)',
                                controller: freqController),
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
                                hintText: 'Conductance - G (Hz)',
                                controller: freqController),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 200,
                            height: 80,
                            child: CustomTextfield(
                                maxLength: 5,
                                maxLines: 1,
                                hintText: 'Capacitance - C (Hz)',
                                controller: freqController),
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
                                hintText: 'ϵ_r',
                                controller: freqController),
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
                                hintText: 'μ_r',
                                controller: freqController),
                          ),
                        ),
                      ],
                    ),

                    //CENTER COLUMN
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            width: 360,
                            height: 100,
                            //color: Apptheme.darker,
                            decoration: BoxDecoration(
                                color: Apptheme.darker,
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
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
                              ],
                            )),
                        //CALCULATION BUTTON
                        Padding(
                          //Padding for Two Wire Line Button
                          padding: const EdgeInsets.all(
                              16.0), // Add padding around the button
                          child: SizedBox(
                            width: 360,
                            height: 50,
                            child: MaterialButton(
                              onPressed: () {
                                setState(() {
                                  //Gets Values in Text Boxes

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
                                });
                              },
                              color: Apptheme.accent,
                              child: Text('CALCULATE'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    //RIGHT COLUMN
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //FIRST CONTAINER
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              width: 360,
                              height: 140,
                              //color: Apptheme.darker,
                              decoration: BoxDecoration(
                                  color: Apptheme.darker,
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  //Title Row
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Coaxial Cable Results',
                                        style: Apptheme.inputStyle,
                                      ),
                                    ],
                                  ),
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
                                ],
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              //SECOND CONTAINER
                              width: 360,
                              height: 140,
                              //color: Apptheme.darker,
                              decoration: BoxDecoration(
                                  color: Apptheme.darker,
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  //Title Row
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Coaxial Cable Results',
                                        style: Apptheme.inputStyle,
                                      ),
                                    ],
                                  ),
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
                                ],
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              //THIRD CONTAINER
                              width: 360,
                              height: 140,
                              //color: Apptheme.darker,
                              decoration: BoxDecoration(
                                  color: Apptheme.darker,
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  //Title Row
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Parallel Plate Results',
                                        style: Apptheme.inputStyle,
                                      ),
                                    ],
                                  ),
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
                                ],
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              //FOURTH CONTAINER
                              width: 360,
                              height: 140,
                              //color: Apptheme.darker,
                              decoration: BoxDecoration(
                                  color: Apptheme.darker,
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  //Title Row
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Microstrip Results',
                                        style: Apptheme.inputStyle,
                                      ),
                                    ],
                                  ),
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
                                ],
                              )),
                        ),
                      ],
                    ),
                  ],
                )
              ])
            ],
          ),
          //MAIN SECOND ROW
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
                                builder: (context) => HomeScreen()),
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
                      'AIR LINE'),
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
