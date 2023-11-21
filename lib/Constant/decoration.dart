import 'package:flutter/material.dart';

class BackgroundColorContainer {
  static BoxDecoration kRadialGradient() {
    return const BoxDecoration(
      gradient: RadialGradient(
        radius: 1.42,
        colors: [
          Color(0xffFFFFFF),
          Color(0xff7D7D7D),
        ],
        stops: [0.0, 1.0],
      ),
    );
  }

  static BoxDecoration kLinearGradient() {
    return const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFFEDEDED),
          Color(0xFFFFFFFF),
          Color(0xFFE0E0E0),
        ],
        stops: [0.0905, 0.3248, 1.0619],
      ),
    );
  }
}
