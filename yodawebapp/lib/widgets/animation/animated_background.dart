import 'package:flutter/material.dart';


class AnimatedWidgetView extends StatefulWidget {
  AnimatedWidgetView({Key key}) : super(key: key);

  _AnimatedWidgetViewState createState() => _AnimatedWidgetViewState();
}

class _AnimatedWidgetViewState extends State<AnimatedWidgetView>
    with TickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    controller.repeat(reverse: true);
    //controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            SizedBox(
              child: Image.asset('images/background.png'),
            ),
            Center(child: GrowingContainer(controller: controller,)),
          ],
        ),
      )
    );
  }
}

class GrowingContainer extends AnimatedWidget {
  GrowingContainer({AnimationController controller})
      : super(
      listenable: Tween<double>(begin: 0, end: 200).animate(controller));

  @override
  Widget build(BuildContext context) {
    Animation<double> animation = listenable;
    return Container(
      height: animation.value,
      width: animation.value,
      child: Image.asset('images/fluid 5.png'),
    );
  }
}