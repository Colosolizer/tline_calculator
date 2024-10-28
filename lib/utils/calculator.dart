//This file contains all the formulas and calculator functions for all the tranmission lines

//Two Wire Line Calculator Functions

import 'package:tline_calculator/utils/constant.dart';
import 'dart:math';

const double e0 = 8.854e-12; //permitivity of free space
const double mu = 4e-7 * pi;

//Calculates the Phase Velocity
double pvelocity(double e_r) {
  double pvel = Constants.speedOfLight / sqrt(e_r);
  return pvel;
}

//Calculates Angular Frequency
double afrequency(double value) {
  double? afreq = 2 * pi * value;
  return afreq;
}

//Calculates Phase Constant (Beta)

double pconstant(double frequency, double er) {
  double pconstant =
      (afrequency(frequency) * sqrt(er)) / Constants.speedOfLight;
  return pconstant;
}

//Calculates Characteristic Impedance (Two Wire)

double twowirecimp(double er, double D, double d) {
  double z_0 = (120 / sqrt(er)) * log((D / d) + sqrt(pow((D / d), 2) - 1));
  return z_0;
}

//Calculates Characteristic Impedance (Coaxial Wire)

double coaxialwirecimp(double er, double b, double a) {
  double z_0 = (60 / sqrt(er)) * log(b / a);
  return z_0;
}

//Calculates Characteristic Impedance (Micro Strip Line )

double microstriplineimp(double h, double t, double w, double er) {
  double z_0 = (87 / (sqrt(er + 1.41))) * log((5.98 * h) / (0.8 * w + t));
  return z_0;
}

//Calculates Characteristic Impedance (Parallel Plate)

double parallelplateimp(double er, double h, double w) {
  double z_0 = ((120 * pi) / sqrt(er)) * (h / w);
  return z_0;
}

//Calculates Characteristic Impedance (General Case)

Complex generalimp(double R, double C, double L, double G, double w) {
  Complex num1 = Complex(R, L);
  Complex num2 = Complex(G, C);
  Complex num3 = num1 / num2;
  Complex z_0 = num3.sqrtc();
  return z_0;
}

//Calculates Admittance

double admittance(double z) {
  double y = 1 / z;
  return y;
}

//For Complex Number Division
class Complex {
  final double real;
  final double imaginary;

  Complex(this.real, this.imaginary);

  // Method to add two complex numbers
  Complex operator +(Complex other) {
    return Complex(real + other.real, imaginary + other.imaginary);
  }

  // Method to multiply two complex numbers
  Complex operator *(Complex other) {
    return Complex(
      real * other.real - imaginary * other.imaginary,
      real * other.imaginary + imaginary * other.real,
    );
  }

  // Method to divide two complex numbers
  Complex operator /(Complex other) {
    double denominator =
        other.real * other.real + other.imaginary * other.imaginary;
    return Complex(
      (real * other.real + imaginary * other.imaginary) / denominator,
      (imaginary * other.real - real * other.imaginary) / denominator,
    );
  }

  Complex sqrtc() {
    double r = sqrt(real * real + imaginary * imaginary); // Magnitude
    double theta = atan2(imaginary, real); // Angle
    double sqrtR = sqrt(r); // Square root of magnitude

    return Complex(
      sqrtR * cos(theta / 2), // Real part
      sqrtR * sin(theta / 2), // Imaginary part
    );
  }

  // Method to get the string representation of a complex number
  @override
  String toString() {
    return '${real} + ${imaginary}j';
  }
}

//Coaxial Specific Formula Functions

//Coaxial Capacitance per unit length

double coacap(double b, double a, double er) {
  double rb = (b / 2) * 0.001;
  double ra = (a / 2) * 0.001;
  double e = er * e0;
  double cc = (2 * pi * e) / (log(rb / ra));
  return cc;
}

//Coaxial Inductance per unit length

double coind(double b, double a) {
  double rb = (b / 2) * 0.001;
  double ra = (a / 2) * 0.001;
  double ind = (mu / (2 * pi)) * log(rb / ra);
  return ind;
}

/////////////////////////////////////////////////

//Propagation Delay

double copdelay(double p) {
  double t = 1 / p;
  return t;
}

//Two Wire Specific Functions

//Capacitance per unit length of a Two Wire TM Line
double twocap(double D, double d1, double er) {
  double r = d1 / 2;
  double cap = (2 * pi * er) / (log((D / 1000) / (r / 1000)));
  return cap;
}

//Inductance per unit length of a Two Wire TM Line
double twoind(double m, double D, double d1) {
  double r = d1 / 2;
  double mu_t = mu * m;
  double ind = (mu_t / pi) / (log((D / 1000) / (r / 1000)));
  return ind;
}
////////////////////////////////

//Parallel Plate Specific Functions

//Capacitance per unit length of a Parallel Plate TM Line in m

double paracap(double er, double w, double l, double h) {
  double e = er * e0;
  double cap = (e * (w / 1000) * (h / 1000)) / l;
  return cap;
}

//Inductance per unit length of a Prallel Plate TM Line in m

double paraind(double m, double l, double w, double h) {
  double m_t = m * mu;
  double ind = (m_t * l) / ((w / 1000) * l);
  return ind;
}

//Microstrip Specific Formulas

//Calculates miceostrip capacitance per unit length
double microcap(double h, double t, double w, double er) {
  double e = er * e0;
  double mcap = (e / h) * (1 / (log(w / t)));
  return mcap;
}

double microind(double w, double t) {
  double mind = (mu / (2 * pi)) * log(w / t);
  return mind;
}

double scalc(double w, double h) {
  return w / h;
}
///////////////