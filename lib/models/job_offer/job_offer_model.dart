// To parse this JSON data, do
//
//     final jobOfferResponse = jobOfferResponseFromMap(jsonString);

import 'dart:convert';

class JobOfferResponse {
    JobOfferResponse({
        required this.message,
        required this.data,
        required this.warning,
    });

    dynamic message;
    List<JobOffer> data;
    bool warning;

    factory JobOfferResponse.fromJson(String str) => JobOfferResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory JobOfferResponse.fromMap(Map<String, dynamic> json) => JobOfferResponse(
        message: json["message"],
        data: List<JobOffer>.from(json["data"].map((x) => JobOffer.fromMap(x))),
        warning: json["warning"],
    );

    Map<String, dynamic> toMap() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
        "warning": warning,
    };
}

class JobOffer {
    JobOffer({
        required this.id,
        required this.title,
        required this.description,
        required this.wage,
        required this.hasHired,
        required this.companyId,
    });

    int id;
    String title;
    String description;
    int wage;
    bool hasHired;
    int companyId;

    factory JobOffer.fromJson(String str) => JobOffer.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory JobOffer.fromMap(Map<String, dynamic> json) => JobOffer(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        wage: json["wage"],
        hasHired: json["hasHired"],
        companyId: json["companyId"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "description": description,
        "wage": wage,
        "hasHired": hasHired,
        "companyId": companyId,
    };
}
