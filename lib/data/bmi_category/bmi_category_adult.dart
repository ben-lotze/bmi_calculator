import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// TODO use csv data for both adults and children
class AdultBmiCategory {

  // TODO should have a getter for categories --> age/gender param, NOT adult/child specific classes

  static List<AdultBmiCategory> categories = [
    AdultBmiCategory.of(AdultBmiCategory.HEAVY_UNDERWEIGHT),
    AdultBmiCategory.of(AdultBmiCategory.MEDIUM_UNDERWEIGHT),
    AdultBmiCategory.of(AdultBmiCategory.LIGHT_UNDERWEIGHT),
    AdultBmiCategory.of(AdultBmiCategory.NORMAL_WEIGHT),
    AdultBmiCategory.of(AdultBmiCategory.OVERWEIGHT),
    AdultBmiCategory.of(AdultBmiCategory.ADIPOSITAS_GRADE_1),
    AdultBmiCategory.of(AdultBmiCategory.ADIPOSITAS_GRADE_2),
    AdultBmiCategory.of(AdultBmiCategory.ADIPOSITAS_GRADE_3),
  ];


  // TODO naming is completely irrelevant by now, can go away
  static const String HEAVY_UNDERWEIGHT = "HEAVY_UNDERWEIGHT";
  static const String MEDIUM_UNDERWEIGHT = "MEDIUM_UNDERWEIGHT";
  static const String LIGHT_UNDERWEIGHT = "LIGHT_UNDERWEIGHT";
  static const String NORMAL_WEIGHT = "NORMAL_WEIGHT";
  static const String OVERWEIGHT = "OVERWEIGHT";
  static const String ADIPOSITAS_GRADE_1 = "ADIPOSITAS_GRADE_1";
  static const String ADIPOSITAS_GRADE_2 = "ADIPOSITAS_GRADE_2";
  static const String ADIPOSITAS_GRADE_3 = "ADIPOSITAS_GRADE_3";

  const AdultBmiCategory.create({
    @required this.name,
    @required this.lowerLimitIncluded,
    @required this.upperLimitExcluded,
    @required this.color,
  });


  factory AdultBmiCategory.of(String name) {
    switch(name) {
      case "HEAVY_UNDERWEIGHT":
        return AdultBmiCategory.create(
            name: "Heavy Underweight",
            lowerLimitIncluded: null,
            upperLimitExcluded: 16,
            color: Color(0xFFb71c1c)
        );
      case "MEDIUM_UNDERWEIGHT":
        return AdultBmiCategory.create(
            name:"Medium Underweight",
            lowerLimitIncluded: 16,
            upperLimitExcluded: 17,
            color: Color(0xFFe64a19)
        );
      case "LIGHT_UNDERWEIGHT":
        return AdultBmiCategory.create(
            name:"Light Underweight",
            lowerLimitIncluded: 17,
            upperLimitExcluded: 18.5,
            color: Color(0xFFfb8c00)
        );
      case "NORMAL_WEIGHT":
        return AdultBmiCategory.create(
            name:"Normal Weight",
            lowerLimitIncluded: 18.5,
            upperLimitExcluded: 25,
            color: Color(0xFF43a047)
        );
      case "OVERWEIGHT":
        return AdultBmiCategory.create(
            name:"Overweight",
            lowerLimitIncluded: 25,
            upperLimitExcluded: 30,
            color: Color(0xFFfdd835)
        );
      case "ADIPOSITAS_GRADE_1":
        return AdultBmiCategory.create(
            name:"Adiposity Grade 1",
            lowerLimitIncluded: 30,
            upperLimitExcluded: 35,
            color: Color(0xFFfb8c00)
        );
      case "ADIPOSITAS_GRADE_2":
        return AdultBmiCategory.create(
            name:"Adiposity Grade 2",
            lowerLimitIncluded: 35,
            upperLimitExcluded: 40,
            color: Color(0xFFe64a19)
        );
      case "ADIPOSITAS_GRADE_3":
        return AdultBmiCategory.create(
            name:"Adiposity Grade 3",
            lowerLimitIncluded: 40,
            upperLimitExcluded: null,
            color: Color(0xFFb71c1c)
        );

      default:
        throw Exception("BmiCategory name='$name' is not defined.");  
    }
  }
  
  final String name;
  final double lowerLimitIncluded;
  final double upperLimitExcluded;
  final Color color;
}



//enum BmiCategoryEnum {
//  HEAVY_UNDERWEIGHT,
//  MEDIUM_UNDERWEIGHT,
//  LIGHT_UNDERWEIGHT,
//  NORMAL_WEIGHT,
//  OVERWEIGHT,
//  ADIPOSITAS_GRADE_1,
//  ADIPOSITAS_GRADE_2,
//  ADIPOSITAS_GRADE_3
//}