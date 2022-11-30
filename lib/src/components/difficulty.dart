import 'package:flutter/material.dart';

class Difficulty extends StatelessWidget {
  const Difficulty({
    this.darkStar = false,
    this.level = 1,
    Key? key,
  }) : super(key: key);
  final bool darkStar;
  final int level;
  render(dark, level, i) {
    if (dark) {
      return Icon(Icons.star,
          size: 12, color: level >= i ? Color.fromARGB(255, 56, 91, 109) : Colors.white70);
    } else {
      return Icon(Icons.star,
          size: 12, color: level >= i ? Colors.pink : Colors.pink[100]);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        render(darkStar, level, 1),
        render(darkStar, level, 2),
        render(darkStar, level, 3),
        render(darkStar, level, 4),
        render(darkStar, level, 5),
      ],
    );
  }
}
