import 'package:flutter/material.dart';
import 'package:mi_proyecto/models/postulant/postulant_model.dart';
import 'package:http/http.dart' as http;

import '../../global/environment.dart';

class RegisterFormProvider extends ChangeNotifier {
  
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  
  String firstName = '';
  String lastName = '';
  int phoneNumber = 0;
  String profilePicture = '';
  String bannerPicture = '';
  String email = '';
  int roleId = 0;
  int id =0 ;

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}