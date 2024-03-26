import 'package:flutter/material.dart';
import 'package:sleeping_app/common/constant/constant_varaiable.dart';

class ButtonChose extends StatelessWidget {
  const ButtonChose({
    super.key,
    required this.voidCallback,
    required this.content,
    this.height = 50,
    this.width = 100,
    this.radius = 10,
    this.color = purpleButton1,
  });
  final VoidCallback voidCallback;
  final Color color;
  final String content;
  final double height;
  final double width;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: voidCallback,
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Text(
          content,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}
