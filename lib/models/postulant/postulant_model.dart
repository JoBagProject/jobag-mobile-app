

import 'dart:convert';

Postulant postulantFromJson(String str) => Postulant.fromJson(json.decode(str));
String postulantToJson(Postulant data) => json.encode(data.toJson());

class Postulant {
    Postulant({
        required this.id,
        required this.firstName,
        required this.lastName,
        required this.salary,
        required this.email,
        required this.phoneNumber,
        required this.profilePicture,
        required this.bannerPicture,
        required this.passwordHash,
        required this.passwordSalt,
        required this.roleId,
    });

    int id;
    String firstName;
    String lastName;
    int salary;
    String email;
    int phoneNumber;
    String profilePicture;
    String bannerPicture;
    String passwordHash;
    String passwordSalt;
    dynamic roleId;

    factory Postulant.fromJson(String str) => Postulant.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Postulant.fromMap(Map<String, dynamic> json) => Postulant(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        salary: json["salary"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        profilePicture: json["profilePicture"],
        bannerPicture: json["bannerPicture"],
        passwordHash: json["passwordHash"],
        passwordSalt: json["passwordSalt"],
        roleId: json["roleId"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "salary": salary,
        "email": email,
        "phoneNumber": phoneNumber,
        "profilePicture": profilePicture,
        "bannerPicture": profilePicture,
        "passwordHash": passwordHash,
        "passwordSalt": passwordSalt,
        "roleId": roleId,
    };
}
