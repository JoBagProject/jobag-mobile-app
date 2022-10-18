import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mi_proyecto/models/postulant/postulant_response_model.dart';

import '../../../global/environment.dart';
import '../../../models/postulant/postulant_model.dart';

class AuthPostulantService with ChangeNotifier {

  bool _autenticando = false;
  late Postulant postulant;
  
  final _storage = new FlutterSecureStorage();

  bool get autenticando => this._autenticando;
  set autenticando( bool valor ) {
    this._autenticando = valor;
    notifyListeners();
  }

  static Future<String?> getToken() async {
    final _storage = new FlutterSecureStorage();
    final token = await _storage.read(key: 'token');
    return token;
  }

  static Future<void> deleteToken() async {
    final _storage = new FlutterSecureStorage();
    await _storage.delete(key: 'token');
  }
  
  Future<bool> login( String email, String password ) async {
    this.autenticando = true;

    final data = {
      'email': email,
      'password': password
    };

    final uri = Uri.parse('${Environment.apiUrl}/Postulant/Login');

    final resp = await http.post( uri, 
      body: jsonEncode(data),
      headers: {
        'Content-Type': 'application/json'
      }
    );

    this.autenticando=false;

    if (resp.statusCode == 200)
    {
      final loginResponse = postulantLoginFromJson(resp.body);
      this.postulant = loginResponse.data.postulant;

      this._guardarToken(loginResponse.data.token);
      return true;
    }
    else{
      return false;
    }
  }

  Future _guardarToken(String token) async {
    return await _storage.write(key: 'token', value: token);
  }

  Future logout() async {
    await _storage.delete(key: 'token');
  }

  Future<String> updatePostulant(Postulant postulant) async
  {
    notifyListeners();

    final url = Uri.http( Environment.apiUrl, '/Postulant/Update');
    final resp = await http.put(url, body: postulant.toJson());
    final decodedData = resp.body;
    print (decodedData);

    return '';
  }
}