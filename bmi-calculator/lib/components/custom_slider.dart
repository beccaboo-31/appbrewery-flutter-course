import 'package:flutter/material.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({@required this.height, @required this.onSlide});

  final int height;
  final Function onSlide;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        activeTrackColor: Colors.white,
        thumbColor: Color(0xFFEB1555),
        overlayColor: Color(0x29EB1555),
        thumbShape:
            RoundSliderThumbShape(enabledThumbRadius: 15.0),
        overlayShape:
            RoundSliderOverlayShape(overlayRadius: 30.0),
      ),
      child: Slider(
        value: height.toDouble(),
        min: 120.0,
        max: 220.0,
        activeColor: Color(0xFFEB1555),
        inactiveColor: Color(0xFF8D8E98),
        onChanged: onSlide,
      ),
    );
  }
}

