import 'package:bmicalculator/data/custom_theme_extension.dart';
import 'package:bmicalculator/widgets/card.dart';
import 'package:bmicalculator/widgets/rounded_icon_button.dart';
import 'package:flutter/material.dart';

class NumberInputCard extends StatefulWidget {

  final String headerTitle;
  final int startValue;
  final int minValue;
  final int maxValue;
  final String unitString;
  final AddSubtractButtonLayout addSubtractButtonLayout;
  final Color addSubtractButtonsBackgroundColor;
  final Function(int newValue) onTapPlus;
  final Function(int newValue) onTapMinus;
  final Function(int newValue) onTapPlusAndMinus;

  const NumberInputCard({
    Key key,
    @required this.startValue,
    @required this.addSubtractButtonLayout,
    this.addSubtractButtonsBackgroundColor = Colors.transparent,
    this.headerTitle, 
    this.onTapPlus, 
    this.onTapMinus,
    this.onTapPlusAndMinus,

    this.minValue = 0,
    this.maxValue = 100,
    this.unitString, 

  }) : super(key: key);

  @override
  _NumberInputCardState createState() => _NumberInputCardState(startValue);
}

class _NumberInputCardState extends State<NumberInputCard> {

  int _currentValue;

  _NumberInputCardState(int startValue) : _currentValue = startValue;

  @override
  Widget build(BuildContext context) {
    return BmiInputCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          
          if (widget.headerTitle != null) Text(
            widget.headerTitle,
            style: Theme.of(context).cardLabelTextStyle(),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: <Widget>[

              if (widget.addSubtractButtonLayout == AddSubtractButtonLayout.NEXT_TO_SLIDER) RoundedIconButton(
                icon: Icons.remove,
                color: widget.addSubtractButtonsBackgroundColor,
                onTap: () => _updateAndNotify(newValue: _currentValue - 1, fallbackFunction: widget.onTapMinus),
              ),

              Container(
                decoration: BoxDecoration(

                ),
              ),
              Card(

              ),

              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(text: _currentValue.round().toString(), style: Theme.of(context).inputFieldTextStyle,),
                    if (widget.unitString != null) TextSpan(text: " ${widget.unitString}",
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).deactivatedCardForegroundColor,
                      ),
                    ),
                  ],
                ),
              ),

              if (widget.addSubtractButtonLayout == AddSubtractButtonLayout.NEXT_TO_SLIDER) RoundedIconButton(
                icon: Icons.add,
                color: widget.addSubtractButtonsBackgroundColor,
                onTap: () => _updateAndNotify(newValue: _currentValue + 1, fallbackFunction: widget.onTapPlus),
              ),
            ],
          ),


          Slider(
            min: widget.minValue.toDouble(),
            max: widget.maxValue.toDouble(),
            value: _currentValue.toDouble() ?? widget.startValue.toDouble(),
            activeColor: Theme.of(context).accentColor,
            inactiveColor: Theme.of(context).deactivatedCardForegroundColor,
            onChanged: (newValue) {
              _updateAndNotify(
                  newValue: newValue.toInt(),
                  fallbackFunction: newValue < _currentValue ? widget.onTapMinus : widget.onTapPlus
              );
            },
          ),

          // buttons
          if (widget.addSubtractButtonLayout == AddSubtractButtonLayout.EXTRA_ROW) Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              RoundedIconButton(
                icon: Icons.remove,
                color: widget.addSubtractButtonsBackgroundColor,
                onTap: () => _updateAndNotify(newValue: _currentValue - 1, fallbackFunction: widget.onTapMinus),
              ),
              SizedBox(width: 16,),
              RoundedIconButton(
                icon: Icons.add,
                color: widget.addSubtractButtonsBackgroundColor,
                onTap: () => _updateAndNotify(newValue: _currentValue + 1, fallbackFunction: widget.onTapPlus),
              ),

            ],
          ),

          SizedBox(height: 8,),
        ],
      ),
    );
  }


  /// [fallbackFunction] will be called in case [widget.onTapPlusAndMinus] is not specified
  void _updateAndNotify({
    @required int newValue,
    Function(int value) fallbackFunction
  }) {
    if (newValue < widget.minValue || newValue > widget.maxValue ) {
      return;
    }
    _currentValue = newValue;
    widget.onTapPlusAndMinus != null ? widget.onTapPlusAndMinus(_currentValue) : fallbackFunction(_currentValue);
    setState(() {});
  }
}



enum AddSubtractButtonLayout {
  NEXT_TO_SLIDER,
  EXTRA_ROW
}



