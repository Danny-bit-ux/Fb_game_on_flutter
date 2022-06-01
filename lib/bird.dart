import 'package:flutter/material.dart';

class FlappyBird extends StatelessWidget {
  const FlappyBird({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65,
      height: 65,
      child: Image.asset('lib/images/flappy-bird3.png'),
    );
  }
}
