import 'package:flutter/material.dart';
import 'package:tline_calculator/Screens/home_screen.dart';
import 'package:tline_calculator/Screens/parallelplate_screen.dart';
import 'package:tline_calculator/utils/app_styles.dart';
import 'package:tline_calculator/widgets/custom_slider.dart';

//COAXIAL TRANSMISSION LINE SCREEN

class CoaxialScreen extends StatefulWidget {
  const CoaxialScreen({super.key});

  @override
  State<CoaxialScreen> createState() => _CoaxialScreen();
}

class _CoaxialScreen extends State<CoaxialScreen> {
  //Variables for Sliders
  double _currentvalue = 0;
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
                //Contains the First Container
                width: 400,
                height: 400,
                child:
                    Container(width: 500, height: 500, color: Apptheme.darker),
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
                  child: _mainbutton(() => null, 'MICROSTRIP LINE'),
                ),
              ]),

          //ROW 3 with first set of sliders
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                //Showcases the Slider Value of R - Slider 1
                //_currentvalue.toString(),
                "Coaxial",
                style: TextStyle(fontSize: 20, color: Apptheme.accent),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Slider(
                  value: _currentvalue,
                  min: 0,
                  max: 10,
                  divisions: 10,
                  activeColor: Apptheme.accent,
                  thumbColor: Apptheme.accent,
                  inactiveColor: Apptheme.darker,
                  onChanged: (value) {
                    setState(() {
                      _currentvalue = value;
                    });
                  },
                ),
              ),
              Text(
                //Showcases the Slider Value of L - Slider 2
                _currentvalue.toString(),
                style: TextStyle(fontSize: 20, color: Apptheme.accent),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Slider(
                  value: _currentvalue,
                  min: 0,
                  max: 10,
                  divisions: 10,
                  activeColor: Apptheme.accent,
                  thumbColor: Apptheme.accent,
                  inactiveColor: Apptheme.darker,
                  onChanged: (value) {
                    setState(() {
                      _currentvalue = value;
                    });
                  },
                ),
              ),
              Text(
                //Showcases the Slider Value of G - Slider 3
                _currentvalue.toString(),
                style: TextStyle(fontSize: 20, color: Apptheme.accent),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Slider(
                  value: _currentvalue,
                  min: 0,
                  max: 10,
                  divisions: 10,
                  activeColor: Apptheme.accent,
                  thumbColor: Apptheme.accent,
                  inactiveColor: Apptheme.darker,
                  onChanged: (value) {
                    setState(() {
                      _currentvalue = value;
                    });
                  },
                ),
              ),
              Text(
                //Showcases the Slider Value of C - Slider 4
                _currentvalue.toString(),
                style: TextStyle(fontSize: 20, color: Apptheme.accent),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Slider(
                  value: _currentvalue,
                  min: 0,
                  max: 10,
                  divisions: 10,
                  activeColor: Apptheme.accent,
                  thumbColor: Apptheme.accent,
                  inactiveColor: Apptheme.darker,
                  onChanged: (value) {
                    setState(() {
                      _currentvalue = value;
                    });
                  },
                ),
              ),
              Text(
                //Showcases the Slider Value of D - Slider 5
                _currentvalue.toString(),
                style: TextStyle(fontSize: 20, color: Apptheme.accent),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Slider(
                  value: _currentvalue,
                  min: 0,
                  max: 10,
                  divisions: 10,
                  activeColor: Apptheme.accent,
                  thumbColor: Apptheme.accent,
                  inactiveColor: Apptheme.darker,
                  onChanged: (value) {
                    setState(() {
                      _currentvalue = value;
                    });
                  },
                ),
              ),
            ],
          ),
          //ROW 4 WITH SECOND SET OF SLIDERS
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              //Showcases the Slider Value of Frequency - Slider 6
              _currentvalue.toString(),
              style: TextStyle(fontSize: 20, color: Apptheme.accent),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Slider(
                value: _currentvalue,
                min: 0,
                max: 10,
                divisions: 10,
                activeColor: Apptheme.accent,
                thumbColor: Apptheme.accent,
                inactiveColor: Apptheme.darker,
                onChanged: (value) {
                  setState(() {
                    _currentvalue = value;
                  });
                },
              ),
            ),
            Text(
              //Showcases the Slider Value of Epsilon_R - Slider 7
              _currentvalue.toString(),
              style: TextStyle(fontSize: 20, color: Apptheme.accent),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Slider(
                value: _currentvalue,
                min: 0,
                max: 10,
                divisions: 10,
                activeColor: Apptheme.accent,
                thumbColor: Apptheme.accent,
                inactiveColor: Apptheme.darker,
                onChanged: (value) {
                  setState(() {
                    _currentvalue = value;
                  });
                },
              ),
            ),
            Text(
              //Showcases the Slider Value of Mu - Slider 8
              _currentvalue.toString(),
              style: TextStyle(fontSize: 20, color: Apptheme.accent),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Slider(
                value: _currentvalue,
                min: 0,
                max: 10,
                divisions: 10,
                activeColor: Apptheme.accent,
                thumbColor: Apptheme.accent,
                inactiveColor: Apptheme.darker,
                onChanged: (value) {
                  setState(() {
                    _currentvalue = value;
                  });
                },
              ),
            ),
            Text(
              //Showcases the Slider Value of Sigma - Slider 9
              _currentvalue.toString(),
              style: TextStyle(fontSize: 20, color: Apptheme.accent),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Slider(
                value: _currentvalue,
                min: 0,
                max: 10,
                divisions: 10,
                activeColor: Apptheme.accent,
                thumbColor: Apptheme.accent,
                inactiveColor: Apptheme.darker,
                onChanged: (value) {
                  setState(() {
                    _currentvalue = value;
                  });
                },
              ),
            )
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
}
