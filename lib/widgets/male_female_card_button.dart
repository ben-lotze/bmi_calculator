import 'package:bmicalculator/data/custom_theme_extension.dart';
import 'package:bmicalculator/data/gender.dart';
import 'package:bmicalculator/widgets/card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MaleFemaleButton extends StatelessWidget {

  final Gender gender;
//  final IconData icon;
  final String text;

  /// Color for icon and text
  final Color backgroundColor;
  final Color foregroundColor;
  final VoidCallback onTap;

  /// is used to calculate transformation in relation to [iconStartSize]
  final int userInputHeight;
  /// is used to calculate transformation in relation to [iconStartSize]
  final int userInputWeight;

  /// basis icon size (relating to to [avgHumanHeight] and [avgHumanWeight])
  final double iconStartSize;
  
  final double avgHumanHeight = 173;      // TODO should be real avg (source?)
  final double avgHumanWeight = 70;
  
  
  MaleFemaleButton({
    Key key,
//    this.icon,
    this.text,
    this.backgroundColor,
    this.foregroundColor,
    this.onTap,
    this.gender,
    this.userInputHeight,
    this.userInputWeight,
    this.iconStartSize = 64,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // TODO: must take into account that same weight with less height means fatter --> use BMI ?
    // SVGs are modified to have no empty padding, otherwise SVG-bottom wanders up/down on height-changes
    double xScale = userInputWeight / avgHumanWeight;
    double yScale = userInputHeight / avgHumanHeight;
    double xOffset = -1 * ((iconStartSize * xScale) - iconStartSize) / 2;
    double yOffset = -1 * ((iconStartSize * yScale) - iconStartSize);
//    print("${describeEnum(gender)} -> xScale=$xScale, iconSize=${iconStartSize*xScale}, xOffset=$xOffset");

    return GestureDetector(
      onTap: onTap,
      child: BmiInputCard(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              tileMode: TileMode.mirror,
              stops: [
                0.2,
                0.35,
                0.5,
                0.65,
                0.8
              ],
              colors: [
                Theme.of(context).cardColor,
                Theme.of(context).cardColor.withAlpha(180),
                Theme.of(context).cardColor.withAlpha(100),
                Theme.of(context).cardColor.withAlpha(40),
                Colors.transparent
              ]
          ),
        ),

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 24),
              Container(

                child: Transform.translate(
                  offset: Offset(xOffset, yOffset),
                  child: Transform(
                      transform: Matrix4.diagonal3Values(xScale, yScale, 1.0),
                      child: Container(
                        child: SvgPicture.asset(
                          this.gender == Gender.MALE
                              ? "assets/svg/human-male.svg"
                              : "assets/svg/human-female.svg",
                          semanticsLabel: 'Gender logo',
                          height: iconStartSize,
                          width: iconStartSize,
                          color: foregroundColor,
                        ),
                      ),
                  ),
                ),
              ),
  
  //            FaIcon(icon, size: 80, color: foregroundColor),
              SizedBox(height: 8),
              Text(text, style: Theme.of(context).cardLabelTextStyle(foregroundColor: foregroundColor)),
            ],
          ),
        ),
      ),
    );
  }
  
}
