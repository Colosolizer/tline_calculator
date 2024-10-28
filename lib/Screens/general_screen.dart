import 'package:flutter/material.dart';
import 'package:tline_calculator/Screens/home_screen.dart';
import 'package:tline_calculator/Screens/microstrip_screen.dart';
import 'package:tline_calculator/Screens/parallelplate_screen.dart';
import 'package:tline_calculator/utils/app_styles.dart';
import 'package:tline_calculator/widgets/custom_textfield.dart';

class GeneralScreen extends StatefulWidget {
  const GeneralScreen({super.key});

  @override
  State<GeneralScreen> createState() => _GeneralScreenState();
}

class _GeneralScreenState extends State<GeneralScreen> {
  //Variables and initializations
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
                                hintText: 'Frequency (Hz)',
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
                                hintText: 'Frequency (Hz)',
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
                                hintText: 'Frequency (Hz)',
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
                                hintText: 'Frequency (Hz)',
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
                                hintText: 'Frequency (Hz)',
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
                                hintText: 'Frequency (Hz)',
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
                          width: 500,
                          height: 300,
                          //color: Apptheme.darker,
                          decoration: BoxDecoration(
                              color: Apptheme.darker,
                              borderRadius: BorderRadius.circular(10.0)),
                        )
                      ],
                    )
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
