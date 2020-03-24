import 'package:bmicalculator/data/gender.dart';

// TODO use csv data for both adults and children
class BmiCategoryChildren {

  final int age;
  final Gender gender;

  final double heavyUnderweightUpperLimitExcluded;
  final double underweightUpperLimitExcluded;
  final double normalWeightUpperLimitExcluded;
  final double overweightUpperLimitExcluded;
  final double heavyOverweightUpperLimitExcluded;   // TODO not necessary, can be else

  const BmiCategoryChildren({
    this.age,
    this.gender,
    this.heavyUnderweightUpperLimitExcluded,
    this.underweightUpperLimitExcluded,
    this.normalWeightUpperLimitExcluded,
    this.overweightUpperLimitExcluded,
    this.heavyOverweightUpperLimitExcluded
  });




  String getCategoryName(double weight) {
    if (weight < heavyUnderweightUpperLimitExcluded) {
      return "Heavy Underweight";
    }
    else if (weight < underweightUpperLimitExcluded) {
      return "Underweight";
    }
    else if (weight < normalWeightUpperLimitExcluded) {
      return "Normal";
    }
    else if (weight < overweightUpperLimitExcluded) {
      return "Overweight";
    }

    return "Heavy Overweight";
  }


  static const List<BmiCategoryChildren> categories = [
    BmiCategoryChildren(
      age: 7,
      gender: Gender.MALE,
      heavyUnderweightUpperLimitExcluded: 12.2,
      underweightUpperLimitExcluded: 13.3,
      normalWeightUpperLimitExcluded: 18,
      overweightUpperLimitExcluded: 23.1,
    ),
    BmiCategoryChildren(
      age: 8,
      gender: Gender.MALE,
      heavyUnderweightUpperLimitExcluded: 12.2,
      underweightUpperLimitExcluded: 13.2,
      normalWeightUpperLimitExcluded: 18.8,
      overweightUpperLimitExcluded: 22.3,
    ),
    BmiCategoryChildren(
      age: 9,
      gender: Gender.MALE,
      heavyUnderweightUpperLimitExcluded: 13,
      underweightUpperLimitExcluded: 13.7,
      normalWeightUpperLimitExcluded: 19.8,
      overweightUpperLimitExcluded: 23.4,
    ),
    BmiCategoryChildren(
      age: 10,
      gender: Gender.MALE,
      heavyUnderweightUpperLimitExcluded: 13.4,
      underweightUpperLimitExcluded: 14.2,
      normalWeightUpperLimitExcluded: 20.7,
      overweightUpperLimitExcluded: 23.4,
    ),
    BmiCategoryChildren(
      age: 11,
      gender: Gender.MALE,
      heavyUnderweightUpperLimitExcluded: 13.8,
      underweightUpperLimitExcluded: 14.7,
      normalWeightUpperLimitExcluded: 20.8,
      overweightUpperLimitExcluded: 22.9,
    ),
    BmiCategoryChildren(
      age: 12,
      gender: Gender.MALE,
      heavyUnderweightUpperLimitExcluded: 14.8,
      underweightUpperLimitExcluded: 15,
      normalWeightUpperLimitExcluded: 0,
      overweightUpperLimitExcluded: 0,
    ),
  ];

}