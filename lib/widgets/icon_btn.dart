import 'package:flutter/material.dart';

class IconBtn extends StatelessWidget {
  final IconData icons;
  const IconBtn({super.key,required this.icons});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(360),
      ),
      child: Icon(
        icons,
        size: 20,
        color: Colors.grey.shade900,
      ),
    );
  }
}
