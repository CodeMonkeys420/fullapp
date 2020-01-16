import 'package:flutter/material.dart';

class GradientBox extends StatelessWidget {
  GradientBox({
    this.colors,
    this.begin = Alignment.topLeft,
    this.end = Alignment.bottomRight,
  });

  final AlignmentGeometry begin;
  final AlignmentGeometry end;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      child: SizedBox.expand(),
      decoration: BoxDecoration(
          image: DecorationImage(//dit change die login screen se back ground
            image: NetworkImage('https://valdevie.co.za/wp-content/uploads/2019/08/61htWk5w.jpg'),
            fit: BoxFit.cover,
          ),
      ),
    );
  }
}
