import 'dart:collection';

class ProfileInformation {
  final LinkedHashMap userInfo;

  ProfileInformation(this.userInfo);

  factory ProfileInformation.test() {
    LinkedHashMap<String, List<String>> testInfo = LinkedHashMap.fromEntries([
      const MapEntry("What are you looking for?", ['Relationship', 'Marriage']),
      const MapEntry("Select your favorite sports?",
          ['Football', 'Baseball', 'Hockey', 'Football', 'Baseball', 'Hockey']),
      const MapEntry("Self care Routine?", [
        'spa',
        'massage',
        'Football',
        'Baseball',
        'Hockey',
        'Football',
        'Baseball',
        'Hockey'
      ]),
      const MapEntry("Creativity?", [
        'spa',
        'massage',
        'Football',
        'Baseball',
        'Hockey',
        'Football',
        'Baseball',
        'Hockey'
      ]),
      const MapEntry("Hangout Activity?", [
        'spa',
        'massage',
        'Football',
        'Baseball',
        'Hockey',
        'Football',
        'Baseball',
        'Hockey'
      ]),
      const MapEntry("Stay in Activity?", [
        'spa',
        'massage',
        'Football',
        'Baseball',
        'Hockey',
        'Football',
        'Baseball',
        'Hockey'
      ]),
      const MapEntry("Film & TV?", [
        'spa',
        'massage',
        'Football',
        'Baseball',
        'Hockey',
        'Football',
        'Baseball',
        'Hockey'
      ]),
    ]);
    return ProfileInformation(testInfo);
  }
}
