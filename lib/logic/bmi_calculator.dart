import 'dart:math' as math;

import 'package:bmicalculator/data/bmi_category/bmi_category_adult.dart';
import 'package:bmicalculator/data/bmi_category/optimal_bmi_weight.dart';
import 'package:bmicalculator/data/gender.dart';
class BmiCalculator {

  static double calculateBmiValue({
    int weight,
    int height,
  }) {
    return weight / math.pow(height / 100, 2);
  }


  /// age and gender specific range which might differ from the normal BMI table
  static String getAdjustedBmiWeightRage({Gender gender, int age}) {
    if (age <= 18) {
      // TODO just show range of child-specific age/gender adjusted BMI table
      return "support for children is work in progress";
    }
    return getOptimalBmiWeight(age: age)
        .getAdjustedWeightRangeDescription(gender: gender, age: age);
  }


  static AdjustedBmiWeightRange getOptimalBmiWeight({int age}) {
    if (age <= 18) {
      throw("getOptimalBmiWeight is not supported for children <= 18y");
    }
    return AdjustedBmiWeightRange.OPTIMAL_BMI_WEIGHTS.firstWhere((optimalWeight) {
      return age >= optimalWeight.ageLowerLimit &&
          age <= optimalWeight.ageUpperLimit;
    });
  }




  static AdultBmiCategory bmiCategory({
    Gender gender,
    int weight,
    int height,
    int age,
  }) {
    double bmi = weight / math.pow(height / 100, 2);
    if (age <= 18) {
      return _bmiCategoryChildren(gender: gender, age: age, height: height, weight: weight);
    }

    return AdultBmiCategory.categories
        .firstWhere((category) =>
    (category.lowerLimitIncluded == null || bmi >= category.lowerLimitIncluded)
        && (category.upperLimitExcluded == null || bmi < category.upperLimitExcluded));
  }


  static AdultBmiCategory _bmiCategoryChildren({
    Gender gender,
    int weight,
    int height,
    int age,
  }) {
    return AdultBmiCategory.create(
        name: "Children are work in progress",
        lowerLimitIncluded: 0,
        upperLimitExcluded: 1000,
        color: null);
  }
}


