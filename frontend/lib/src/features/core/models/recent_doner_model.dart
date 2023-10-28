import 'package:frontend/config.dart';

List<RecentDoner> recentDonerFromJson(dynamic str) =>
    List<RecentDoner>.from((str).map((x) => RecentDoner.fromJson(x)));

class RecentDoner {
  String fullName;
  String email;
  String? profilePicture;

  RecentDoner({
    required this.fullName,
    required this.email,
    this.profilePicture,
  });

  factory RecentDoner.fromJson(Map<String, dynamic> json) {
    return RecentDoner(
      fullName: json['fullName'],
      email: json['email'],
      profilePicture: json['profilePicture'],
    );
  }
}

extension RecentDonerModelExt on RecentDoner {
  String get fullImagePath =>
      profilePicture != null ? Config.imageURL + profilePicture! : '';
}
