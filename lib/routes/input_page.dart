import 'package:bmicalculator/data/custom_theme_extension.dart';
import 'package:bmicalculator/data/gender.dart';
import 'package:bmicalculator/routes/result_page.dart';
import 'package:bmicalculator/widgets/male_female_card_button.dart';
import 'package:bmicalculator/widgets/number_input_card.dart';
import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender userInputGender;
  int userInputHeight;
  int userInputWeight;
  int userInputAge;

  @override
  void initState() {
    super.initState();
    userInputHeight = 170;
    userInputWeight = 70;
    userInputAge = 25;
    // starting with no gender pre-selected
  }

  @override
  Widget build(BuildContext context) {
    print("full height: ${MediaQuery.of(context).size.height}");

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR', style: TextStyle(), textAlign: TextAlign.center,),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Container(
          color: Theme.of(context).cardColor,
        ),
      ),
      body: Builder(
        builder: (context) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[

            Expanded(
              child: LayoutBuilder(
                  builder: (context, constraints) {
                    print("Expanded height: ${constraints.maxHeight}");
                    return ListView(
                      padding: EdgeInsets.symmetric(horizontal: Theme.of(context).cardMargin / 2, vertical: 0),
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Flexible(
                              child: MaleFemaleButton(
                                  text: "FEMALE",
                                  gender: Gender.FEMALE,
                                  backgroundColor: Colors.transparent,
                                  userInputHeight: userInputHeight,
                                  userInputWeight: userInputWeight,
//                              icon: FontAwesomeIcons.venus,
                                  foregroundColor: userInputGender == Gender.FEMALE
                                      ? Theme.of(context).accentColor
                                      : Theme.of(context).deactivatedCardForegroundColor,
                                  onTap: () {
                                    userInputGender = Gender.FEMALE;
                                    setState(() {});
                                  }),
                            ),
                            Flexible(
                              child: MaleFemaleButton(
                                  text: "MALE",
                                  gender: Gender.MALE,
//                              icon: FontAwesomeIcons.mars,
                                  backgroundColor: Colors.transparent,
                                  userInputHeight: userInputHeight,
                                  userInputWeight: userInputWeight,
                                  foregroundColor: userInputGender == Gender.MALE
                                      ? Theme.of(context).accentColor
                                      : Theme.of(context).deactivatedCardForegroundColor,
                                  onTap: () {
                                    userInputGender = Gender.MALE;
                                    setState(() {});
                                  }),
                            ),
                          ],
                        ),


                        // height
                        Center(
                          child: NumberInputCard(
                            addSubtractButtonLayout: AddSubtractButtonLayout.NEXT_TO_SLIDER,
                            startValue: 170,
                            minValue: 50,
                            maxValue: 220,
                            unitString: "cm",
                            onTapPlusAndMinus: (newHeight) {
                              userInputHeight = newHeight;
                              setState(() {});
                            },
                          ),
                        ),



                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[

                            // weight
                            Flexible(
                              flex: 1,
                              child: Center(
                                child: NumberInputCard(
                                  addSubtractButtonLayout: AddSubtractButtonLayout.EXTRA_ROW,
                                  addSubtractButtonsBackgroundColor: Theme.of(context).accentColor,
                                  startValue: 70,
                                  minValue: 1,
                                  maxValue: 300,
                                  unitString: "kg",
                                  onTapPlusAndMinus: (newWeight) {
                                    userInputWeight = newWeight;
                                    setState(() {});
                                  },
                                ),
                              ),
                            ),

                            // age
                            Flexible(
                              flex: 1,
                              child: Center(
                                child: NumberInputCard(
                                  addSubtractButtonLayout: AddSubtractButtonLayout.EXTRA_ROW,
                                  addSubtractButtonsBackgroundColor: Theme.of(context).accentColor,
                                  startValue: 25,
                                  minValue: 7,
                                  maxValue: 100,
                                  unitString: "years",
                                  onTapPlusAndMinus: (newAge) {
                                    userInputAge = newAge;
                                    setState(() {});
                                  },
                                ),
                              ),
                            ),


                          ],
                        ),
                      ],
                    );
                  }
              ),
            ),


            // START button
            // No padding, should float into edges of rounded corners etc
            InkWell(
              onTap: () => calculateBmiPressed(context),
              child: Container(
                child: Center(child: Text("CALCULATE YOUR BMI", style: TextStyle(fontSize: 20),)),
                width: double.infinity,
                padding: const EdgeInsets.all(36),
                decoration: BoxDecoration(color: Theme.of(context).accentColor),
              ),
            )
          ],
        ),
      ),
    );
  }


  void calculateBmiPressed(BuildContext context) {
    if (userInputGender == null) {
      Scaffold.of(context).showSnackBar(SnackBar(content: Text("Please select your gender."),));
      return;
    }

    Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
        ResultPage(
          userInputAge: userInputAge,
          userInputGender: userInputGender,
          userInputHeight: userInputHeight,
          userInputWeight: userInputWeight,
        ),),);
  }

}
