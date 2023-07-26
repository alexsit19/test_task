import 'package:flutter/material.dart';

class SinglePostRow extends StatelessWidget {
  final String rowName;
  final String textContent;
  final double size;
  final FontWeight weight;

  const SinglePostRow({
    Key? key,
    required this.rowName,
    required this.textContent,
    required this.weight,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "$rowName : ",
          style: TextStyle(fontWeight: weight, fontSize: size),
        ),
        Text(
          textContent,
          style: TextStyle(fontSize: size),
        )
      ],
    );
  }
}
