import 'package:flutter/material.dart';

class RoundedIconButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final double size;
  final Color color;


  const RoundedIconButton({
    Key key,
    this.onTap,
    this.icon,
    this.size = 36,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: IconButton(
        icon: Icon(icon),
        constraints: BoxConstraints.expand(width: size, height: size),
        padding: const EdgeInsets.all(0),
        onPressed: onTap,
      ),
    );
  }
}