import 'package:complex_num/complex_num.dart';
import 'package:tline_calculator/utils/constant.dart';

//Calculate General Impedance

zgeneral(double R, double L, double G, double C, double w1) {
  double i1 = w1 * L;
  double i2 = w1 * C;
  final z1 = Complex(R, i1) / Complex(L, i2);
  final z2 = sqrt(z1);
  return z2;
}
