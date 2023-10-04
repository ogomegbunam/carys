import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class DatesModel extends Equatable {
  final String firstName;
  final String lastName;
  final int age;
  final List<String> images;
  final String aboutMe;
  final String location;
  final String occupation;
  final String education;
  final int distance;
  bool private;
  final List<String> basics;
  final List<String> interest;

  DatesModel({
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.images,
    required this.aboutMe,
    required this.location,
    required this.occupation,
    required this.education,
    required this.distance,
    required this.basics,
    required this.interest,
    this.private = false,
  });

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        age,
        images,
        aboutMe,
        location,
        occupation,
        education,
        distance,
        basics,
        interest,
        private,
      ];

  static List<DatesModel> all = [
    DatesModel(
        firstName: 'John',
        lastName: 'doe',
        age: 29,
        images: const [
          'assets/images/user_profile.png',
          'assets/images/user_profile.png',
          'assets/images/user_profile.png',
        ],
        aboutMe:
            "This weekend's special , i'm working remotely and i'm loving it , it's going to all make sense. ",
        location: 'Abuja, Nigeria',
        occupation: 'Medical Doctor',
        education: 'University of Abuja',
        distance: 8,
        basics: const ['Women', 'Relationship', 'Catholic', 'Moderate'],
        interest: const ['Running', 'Movies', 'Football']),
    DatesModel(
        firstName: 'Monday',
        lastName: 'doey',
        age: 25,
        images: const [
          'assets/images/user_profile.png',
          'assets/images/user_profile.png',
          'assets/images/user_profile.png',
        ],
        aboutMe:
            "This weekend's special , i'm working remotely and i'm loving it , it's going to all make sense. ",
        location: 'Abuja, Nigeria',
        occupation: 'Medical Doctor',
        education: 'University of Abuja',
        distance: 8,
        basics: const ['Women', 'Relationship', 'Catholic', 'Moderate'],
        interest: const ['Running', 'Movies', 'Football']),
    DatesModel(
        firstName: 'Johnson',
        lastName: 'doe',
        age: 30,
        images: const [
          'assets/images/user_profile.png',
          'assets/images/user_profile.png',
          'assets/images/user_profile.png',
        ],
        aboutMe:
            "This weekend's special , i'm working remotely and i'm loving it , it's going to all make sense. ",
        location: 'Abuja, Nigeria',
        occupation: 'Medical Doctor',
        education: 'University of Abuja',
        distance: 8,
        basics: const ['Women', 'Relationship', 'Catholic', 'Moderate'],
        interest: const ['Running', 'Movies', 'Football'],
        private: true),
  ];
}
