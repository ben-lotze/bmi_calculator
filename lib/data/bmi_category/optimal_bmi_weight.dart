import 'package:bmicalculator/data/gender.dart';

class AdjustedBmiWeightRange {

  static const List<AdjustedBmiWeightRange> OPTIMAL_BMI_WEIGHTS = [
//    AdjustedBmiWeightRange(
//      ageLowerLimit: 0, ageUpperLimit: 18,
//      weightMaleLowerLimit: null, weightMaleUpperLimit: null,
//      weightFemaleLowerLimit: null, weightFemaleUpperLimit: null,
//    ),
    AdjustedBmiWeightRange(
      ageLowerLimit: 19, ageUpperLimit: 24,
      weightMaleLowerLimit: 18, weightMaleUpperLimit: 24,
      weightFemaleLowerLimit: 19, weightFemaleUpperLimit: 23,
    ),
    AdjustedBmiWeightRange(
      ageLowerLimit: 25, ageUpperLimit: 34,
      weightMaleLowerLimit: 20, weightMaleUpperLimit: 25,
      weightFemaleLowerLimit: 19, weightFemaleUpperLimit: 24,
    ),
    AdjustedBmiWeightRange(
      ageLowerLimit: 35, ageUpperLimit: 44,
      weightMaleLowerLimit: 21, weightMaleUpperLimit: 26,
      weightFemaleLowerLimit: 20, weightFemaleUpperLimit: 25,
    ),
    AdjustedBmiWeightRange(
      ageLowerLimit: 45, ageUpperLimit: 54,
      weightMaleLowerLimit: 22, weightMaleUpperLimit: 27,
      weightFemaleLowerLimit: 21, weightFemaleUpperLimit: 26,
    ),
    AdjustedBmiWeightRange(
      ageLowerLimit: 55, ageUpperLimit: 64,
      weightMaleLowerLimit: 23, weightMaleUpperLimit: 28,
      weightFemaleLowerLimit: 22, weightFemaleUpperLimit: 27,
    ),
    AdjustedBmiWeightRange(
      ageLowerLimit: 65, ageUpperLimit: 1000,
      weightMaleLowerLimit: 24, weightMaleUpperLimit: 29,
      weightFemaleLowerLimit: 23, weightFemaleUpperLimit: 28,
    ),
  ];

  const AdjustedBmiWeightRange({
    this.ageLowerLimit,
    this.ageUpperLimit,
    this.weightFemaleLowerLimit,
    this.weightFemaleUpperLimit,
    this.weightMaleLowerLimit,
    this.weightMaleUpperLimit,
  });

  final int ageLowerLimit;
  final int ageUpperLimit;
  final double weightFemaleLowerLimit;
  final double weightFemaleUpperLimit;
  final double weightMaleLowerLimit;
  final double weightMaleUpperLimit;



  /// adjusted for age/gender
  String getAdjustedWeightRangeDescription({Gender gender, int age}) {

    if (age <= 18) {
      // TODO no text here -> child table is already age/gender adjusted --> 2nd tab in result can be removed too
      return "";
    }

    double lower = gender == Gender.MALE ? weightMaleLowerLimit : weightFemaleLowerLimit;
    double upper = gender == Gender.MALE ? weightMaleUpperLimit : weightFemaleUpperLimit;
    String result = "Age/gender adjusted optimal range: $lower - $upper kg";
    return result;
  }
}