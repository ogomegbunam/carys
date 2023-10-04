import 'package:equatable/equatable.dart';

class DatesFilterModel extends Equatable {
  final int minAge;
  final int maxAge;
  final bool showMoreAge;
  final bool showVerifiedAccount;
  final int distance;
  final bool showMoreDistance;
  final bool hidePrivateProfile;

  // static variables
  static int maxSelectAge = 50;
  static int minSelectAge = 18;
  static int maxDistance = 200;

  const DatesFilterModel(
      {required this.minAge,
      required this.maxAge,
      required this.showMoreAge,
      required this.showVerifiedAccount,
      required this.distance,
      required this.showMoreDistance,
      required this.hidePrivateProfile});

  factory DatesFilterModel.initial() {
    return const DatesFilterModel(
        minAge: 18,
        maxAge: 30,
        showMoreAge: false,
        showVerifiedAccount: true,
        distance: 20,
        showMoreDistance: true,
        hidePrivateProfile: true);
  }

  DatesFilterModel copy({
    int? minAge,
    int? maxAge,
    bool? showMoreAge,
    bool? showVerifiedAccount,
    int? distance,
    bool? showMoreDistance,
    bool? hidePrivateProfile,
  }) =>
      DatesFilterModel(
        minAge: minAge ?? this.minAge,
        maxAge: maxAge ?? this.maxAge,
        showMoreAge: showMoreAge ?? this.showMoreAge,
        showVerifiedAccount: showVerifiedAccount ?? this.showVerifiedAccount,
        distance: distance ?? this.distance,
        showMoreDistance: showMoreDistance ?? this.showMoreDistance,
        hidePrivateProfile: hidePrivateProfile ?? this.hidePrivateProfile,
      );

  @override
  List<Object?> get props => [
        minAge,
        maxAge,
        showMoreAge,
        showVerifiedAccount,
        distance,
        showMoreDistance,
        hidePrivateProfile,
      ];
}
