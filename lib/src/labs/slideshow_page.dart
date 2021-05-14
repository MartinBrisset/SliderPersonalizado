import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:provider/provider.dart';
import 'package:ejemplo1/src/models/slider_model.dart';

class SlideShowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new SliderModel(),
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: _Slides(),
            ),
            _Dots()
          ],
        )
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      // color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          _Dot(0),
          _Dot(1),
          _Dot(2),

        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {

  final int index;

  _Dot( this.index );

  @override
  Widget build(BuildContext context) {

    final pageViewIndex = Provider.of<SliderModel>(context).currentPage;

    return AnimatedContainer(
      duration: new Duration(microseconds: 200),
      width: 12,
      height: 12,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: ( pageViewIndex >= index - 0.5 && pageViewIndex < index + 0.5 )
                  ? Colors.blue : Colors.black,
        shape: BoxShape.circle
      ),
    );
  }
}

class _Slides extends StatefulWidget {
  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {

  final pageViewController = new PageController();

  @override
  void initState() {
    super.initState();

    pageViewController.addListener(() {
      // print('Pagina actual: ${ pageViewController.page }');
      //Actualizar el provider
      Provider.of<SliderModel>(context, listen: false).currentPage = pageViewController.page;
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageViewController,
        children: <Widget>[
          _Slide('assets/svgs/slider-1.svg'),
          _Slide('assets/svgs/slider-2.svg'),
          _Slide('assets/svgs/slider-3.svg'),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {

  final String svg;

  _Slide( this.svg );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30.0),
      child: SvgPicture.asset(svg),
    );
  }
}