import 'package:flutter/material.dart';

import '../data/custom_theme_extension.dart';

class BmiInputCard extends StatelessWidget {

  final Widget child;
  final Color color;
  final BoxDecoration decoration;
  final EdgeInsets padding;

  const BmiInputCard({
    Key key,
    this.child,
    this.color,
    this.decoration,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(Theme.of(context).cardMargin / 2),
      decoration: decoration ?? BoxDecoration(
        color: color != null ? color : Theme.of(context).cardColor,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),

      child: Padding(
        padding: padding ?? const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
        child: child,
      ),
    );
  }
}