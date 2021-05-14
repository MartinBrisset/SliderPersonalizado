import 'package:flutter/material.dart';
import 'package:ejemplo1/src/widgets/slideshow.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SlideShowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
        children: [
          Expanded(child: MiSliderShow()),
          Expanded(child: MiSliderShow()),
        ],
      )
    );
  }
}

class MiSliderShow extends StatelessWidget {
  const MiSliderShow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slideshow(
      bulletPrimario: 15,
      bulletSecundario: 10,
      puntosArriba: true,
      colorPrimario: Colors.yellow,
      colorSecundario: Colors.black,
      slides:<Widget> [
        SvgPicture.asset('assets/svgs/slider-1.svg'),
        SvgPicture.asset('assets/svgs/slider-2.svg'),
        SvgPicture.asset('assets/svgs/slider-3.svg'),
      ],
    );
  }
}