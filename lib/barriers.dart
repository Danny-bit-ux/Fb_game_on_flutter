import 'package:flutter/material.dart';

class LocationBarriers extends StatelessWidget {
  final size;

  const LocationBarriers({Key? key, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: size,
      decoration: BoxDecoration(
        color: Colors.green,
        border: Border.all(
          width: 10,
          color: Colors.lightGreen,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
