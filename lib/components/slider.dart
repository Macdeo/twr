import 'package:flutter/material.dart';
import 'package:flutter_custom_carousel_slider/flutter_custom_carousel_slider.dart';

class Sliders extends StatefulWidget {
  const Sliders({Key? key}) : super(key: key);

  @override
  _SlidersState createState() => _SlidersState();
}

class _SlidersState extends State<Sliders> {
  List<CarouselItem> itemList = [
    CarouselItem(
      image: const AssetImage('assets/images/8c6a05eb.png'),
      boxDecoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.bottomCenter,
          end: FractionalOffset.topCenter,
          colors: [
            Colors.blueAccent.withOpacity(1),
            Colors.black.withOpacity(.3)
          ],
          stops: const [0.0, 1.0],
        ),
      ),
    ),
    CarouselItem(
      image: const AssetImage('assets/images/9d54ecc6.png'),
      boxDecoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.bottomCenter,
          end: FractionalOffset.topCenter,
          colors: [
            Colors.blueAccent.withOpacity(1),
            Colors.black.withOpacity(.3)
          ],
          stops: const [0.0, 1.0],
        ),
      ),
    ),
    CarouselItem(
      image: const AssetImage('assets/images/00a769e9.png'),
      boxDecoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.bottomCenter,
          end: FractionalOffset.topCenter,
          colors: [
            Colors.blueAccent.withOpacity(1),
            Colors.black.withOpacity(.3)
          ],
          stops: const [0.0, 1.0],
        ),
      ),
    ),
    CarouselItem(
      image: const AssetImage('assets/images/af9015ea.png'),
      boxDecoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.bottomCenter,
          end: FractionalOffset.topCenter,
          colors: [
            Colors.blueAccent.withOpacity(1),
            Colors.black.withOpacity(.3)
          ],
          stops: const [0.0, 1.0],
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Center(
          child: CustomCarouselSlider(
        items: itemList,
        height: screenHeight * 0.15,
        // subHeight: 50,
        showSubBackground: false,
        animationDuration: const Duration(microseconds: 3000),
        indicatorPosition: IndicatorPosition.none,
        autoplayDuration: const Duration(seconds: 5),
        width: MediaQuery.of(context).size.width * 1,
      )),
    );
  }
}
