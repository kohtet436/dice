import 'package:dice/provider/point_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserPoint extends StatelessWidget {
  final EdgeInsetsGeometry margin;
  const UserPoint({Key? key, this.margin = const EdgeInsets.only(top: 20)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: margin,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 1),
            color: Colors.black26,
            spreadRadius: 0.1,
          )
        ],
      ),
      child: Consumer<PointProvider>(
        builder: (_, provider, child) => Text(
          "Points : ${provider.point}",
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }
}
