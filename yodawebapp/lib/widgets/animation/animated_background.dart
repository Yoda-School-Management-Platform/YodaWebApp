import 'package:flutter/material.dart';


class AnimatedBackground extends StatefulWidget {

  final height;
  final width;

  const AnimatedBackground({Key key, this.height, this.width}) : super(key: key);

  _AnimatedBackground createState() => _AnimatedBackground();
}

class _AnimatedBackground extends State<AnimatedBackground>
    with TickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(seconds: 4));
    controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Stack(
            children: <Widget>[
              SizedBox(
                height: widget.height,
                width: widget.width,
                child: Image.asset('images/background.png', fit: BoxFit.fill),
              ),
              Center(child: MovingContainer(controller: controller, )),
            ],
          ),
        )
    );
  }
}

class MovingContainer extends AnimatedWidget {

  MovingContainer({AnimationController controller})
      : super(
      listenable: Tween<double>(begin: -10, end: 10).animate(controller));

  @override
  Widget build(BuildContext context) {
    Animation<double> animation = listenable;
    return Transform.translate(
      offset: Offset(animation.value, animation.value * -1),
      child: Container(
      height: 700,
      width: 700,
      child: Image.asset('images/fluid 5.png',),
    ),);
  }
}