import 'package:flutter/foundation.dart';
import 'package:mi_proyecto/models/job_offer/job_offer_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as cnv;

import '../../../global/environment.dart';

class JobOfferProvider with ChangeNotifier {
  List<JobOffer> currentJobOffers = [];

  JobOfferProvider()
  {
    this.getJobOffers();

  }

  getJobOffers() async {
    var url = Uri.http('10.0.2.2:5193','/api/JobOffer/GetAll');
    final response = await http.get(url);
    print(response);
    final jobOffersResponse = JobOfferResponse.fromJson(response.body);
    print(jobOffersResponse.data[0].description);
    this.currentJobOffers = jobOffersResponse.data;
    notifyListeners();
  }
}