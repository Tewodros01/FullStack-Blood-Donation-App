import 'package:frontend/config.dart';

List<BloodRequest> bloodRequestFromJson(dynamic str) =>
    List<BloodRequest>.from((str).map((x) => BloodRequest.fromJson(x)));

class BloodRequest {
  String bloodType;
  String reason;
  double unitRequired;
  String deadLine;
  String hospital;
  String? personInCharge;
  String contactNumber;
  String patientName;
  String location;
  String? requestId;
  List<String>? userDoners;
  int? pendingState;
  int? completedState;
  RequesterUser? requesterUser;

  BloodRequest({
    required this.bloodType,
    required this.reason,
    required this.unitRequired,
    required this.deadLine,
    required this.hospital,
    this.personInCharge,
    required this.contactNumber,
    required this.patientName,
    required this.location,
    this.requestId,
    this.userDoners,
    this.pendingState,
    this.completedState,
    this.requesterUser,
  });

  factory BloodRequest.fromJson(Map<String, dynamic> json) {
    return BloodRequest(
      requestId: json['requestId'],
      bloodType: json['bloodType'],
      reason: json['reason'],
      unitRequired: json['unitRequired'],
      deadLine: json['deadLine'],
      hospital: json['hospital'],
      personInCharge: json['personInCharge'],
      contactNumber: json['contactNumber'],
      patientName: json['patientName'],
      location: json['location'],
      userDoners: json['userDoners'] != null
          ? List<String>.from(json['userDoners'].map((x) => x.toString()))
          : null,
      pendingState: json['pendingState'],
      completedState: json['completedState'],
      requesterUser: RequesterUser.fromJson(json['requesterId']),
      // Deserialize requesterUser from JSON
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'bloodType': bloodType,
      'reason': reason,
      'unitRequired': unitRequired,
      'deadLine': deadLine,
      'hospital': hospital,
      'personInCharge': personInCharge,
      'contactNumber': contactNumber,
      'patientName': patientName,
      'location': location,
      'requestId': requestId,
    };
  }
}

class RequesterUser {
  String fullName;
  String email;
  String phoneNo;
  String userId;
  String? profilePicture;

  RequesterUser({
    required this.fullName,
    required this.email,
    required this.phoneNo,
    required this.userId,
    this.profilePicture,
  });

  factory RequesterUser.fromJson(Map<String, dynamic> json) {
    return RequesterUser(
      fullName: json['fullName'],
      email: json['email'],
      phoneNo: json['phoneNo'],
      userId: json['userId'],
      profilePicture: json['profilePicture'],
    );
  }
}

extension RequesterUserModelExt on RequesterUser {
  String get fullImagePath =>
      profilePicture != null ? Config.imageURL + profilePicture! : '';
}
