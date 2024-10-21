import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';

class CustomSlider extends StatefulWidget {
  final double? min;
  final double max;
  final int divisions;
  final Color activecolor;
  final Color inactivecolor;
  final Color thumbcolor;
  final double? currentvalue;
  final double? value;

  const CustomSlider(
      {super.key,
      this.min,
      required this.max,
      required this.divisions,
      required this.activecolor,
      required this.inactivecolor,
      required this.thumbcolor,
      required this.currentvalue,
      this.value});

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  late List<double> sliderValues = [
    widget.currentvalue ?? widget.min?.toDouble() ?? 0.0
  ];
  @override
  Widget build(BuildContext context) {
    return FlutterSlider(
        values: sliderValues, min: widget.min, max: widget.max);
  }
}
