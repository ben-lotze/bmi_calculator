import 'dart:ui';

import 'package:bmicalculator/data/bmi_category/bmi_category_adult.dart';
import 'package:bmicalculator/data/bmi_category/optimal_bmi_weight.dart';
import 'package:bmicalculator/data/custom_theme_extension.dart';
import 'package:bmicalculator/data/gender.dart';
import 'package:bmicalculator/logic/bmi_calculator.dart';
import 'package:bmicalculator/widgets/card.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {

  final Gender userInputGender;
  final int userInputHeight;
  final int userInputWeight;
  final int userInputAge;

  const ResultPage({
    Key key,
    this.userInputGender,
    this.userInputHeight,
    this.userInputWeight,
    this.userInputAge
  }) : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> with SingleTickerProviderStateMixin {
  double _bmi;
  TabController _tabController;
  
  @override
  void initState() {
    super.initState();
    _bmi = BmiCalculator.calculateBmiValue(weight: widget.userInputWeight, height: widget.userInputHeight);
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
  }
  
  @override
  Widget build(BuildContext context) {
    AdultBmiCategory bmiCategory = BmiCalculator.bmiCategory(
        gender: widget.userInputGender,
        age: widget.userInputAge,
        height: widget.userInputHeight,
        weight: widget.userInputWeight
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('YOUR BMI', style: TextStyle(), textAlign: TextAlign.center,),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[



            Padding(
              padding: EdgeInsets.all(Theme.of(context).cardMargin / 2),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Text(
                      _bmi.toStringAsFixed(1),
                      style: TextStyle(fontSize: 64, fontWeight: FontWeight.bold, color: bmiCategory.color) ,
                      textAlign: TextAlign.center,
                    ),

                    Text(
                      bmiCategory.name,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: bmiCategory.color),
                      textAlign: TextAlign.center,
                    ),

                    SizedBox(height: 8),
                    Text(
                      BmiCalculator.getAdjustedBmiWeightRage(gender: widget.userInputGender, age: widget.userInputAge),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),


            Expanded(
              child: Padding(
                padding: EdgeInsets.all(Theme.of(context).cardMargin / 2),
                child: BmiInputCard(
                  child: Center(
                    child: Column(
                      children: <Widget>[

                        TabBar(
                          labelPadding: const EdgeInsets.all(8),
//                          indicatorColor: Theme.of(context).accentColor,
                          indicatorColor: Colors.white,
                          indicatorSize: TabBarIndicatorSize.label,
                          controller: _tabController,
                          tabs: <Widget>[
                            Text("BMI\nCategories", textAlign: TextAlign.center,),
                            Text("Age & Gender\nAdjusted Optimum", textAlign: TextAlign.center),
                          ],
                        ),

                        Expanded(
                          child: TabBarView(
                            controller: _tabController,
                            children: <Widget>[
                              SingleChildScrollView(child: BmiCategoryList(userBmi: _bmi,)),
                              BmiAgeAdjustedOptimumList(userAge: widget.userInputAge),
                            ],
                          ),
                        ),


                      ],
                    ),
                  ),
                ),
              ),
            ),



          ],
        ),
      )
    );
  }
}



class BmiCategoryList extends StatelessWidget {

  final double userBmi;

  const BmiCategoryList({
    Key key,
    @required this.userBmi
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable(

      columns: <DataColumn>[
        DataColumn(label: Text("Category"), numeric: false),
        DataColumn(label: Text("Lower limit"), numeric: true),
        DataColumn(label: Text("Upper limit"), numeric: true),
      ],
      rows: List.generate(AdultBmiCategory.categories.length, (index) {
        AdultBmiCategory category = AdultBmiCategory.categories[index];
        bool isSelected = (category.lowerLimitIncluded == null || userBmi >= category.lowerLimitIncluded)
            && (category.upperLimitExcluded == null || userBmi < category.upperLimitExcluded);
        return DataRow(
          selected: isSelected,
          cells: [
            DataCell(Text(
              category.name,
              style: selectedRowTextStyle(isSelected: isSelected, category: category,),
            ),),

            DataCell(Text(
              category.lowerLimitIncluded?.toStringAsFixed(1) ?? "-",
              style: selectedRowTextStyle(isSelected: isSelected, category: category,),
            ),),
            DataCell(Text(
              // currently: upper limit needs to be adjusted for UI, otherwise one category's max is another's min
              category.upperLimitExcluded != null ? (category.upperLimitExcluded - 0.1).toStringAsFixed(1) : "-",
              style: selectedRowTextStyle(isSelected: isSelected, category: category,),
            ),),
          ]
        );
      })
    );

  }

  TextStyle selectedRowTextStyle({bool isSelected, AdultBmiCategory category}) {
    return isSelected
        ? TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: category.color, decoration: TextDecoration.underline)
        : TextStyle(color: category.color);
  }

}


class BmiAgeAdjustedOptimumList extends StatelessWidget {

  final int userAge;

  const BmiAgeAdjustedOptimumList({Key key, this.userAge}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<AdjustedBmiWeightRange> optimalRanges = AdjustedBmiWeightRange.OPTIMAL_BMI_WEIGHTS;
    return DataTable(
        columns: <DataColumn>[
          DataColumn(label: Text("Age"), numeric: false),
          DataColumn(label: Text("BMI Male"), numeric: true),
          DataColumn(label: Text("BMI Female"), numeric: true),
        ],
        rows: List.generate(optimalRanges.length, (index) {
          AdjustedBmiWeightRange range = optimalRanges[index];
          bool isSelectedRow = userAge >= range.ageLowerLimit && userAge < range.ageUpperLimit;
          return DataRow(
            selected: isSelectedRow,
            cells: [
              DataCell(Text(
                "${range.ageLowerLimit} - ${index < optimalRanges.length-1 ? range.ageUpperLimit : "End"}",
                style: getActiveRowTextStyle(isSelectedRow: isSelectedRow),
              ),),

              DataCell(Text(
                "${range.weightMaleLowerLimit.toInt()} - ${range.weightMaleUpperLimit.toInt()}",
                style: getActiveRowTextStyle(isSelectedRow: isSelectedRow),
              ),),
              DataCell(Text(
                "${range.weightFemaleLowerLimit.toInt()} - ${range.weightFemaleUpperLimit.toInt()}",
                style: getActiveRowTextStyle(isSelectedRow: isSelectedRow),
              ),),
            ]
          );
        })
    );
  }

  TextStyle getActiveRowTextStyle({@required bool isSelectedRow}) => isSelectedRow
      ? TextStyle(fontSize: 16, fontWeight: FontWeight.bold, decoration: TextDecoration.underline)
      : null;

}
