import 'dart:io';

class Environment {
  static String apiUrl    = Platform.isAndroid ? 'http://10.0.2.2:5193/api' : 'http://localhost:3000/api';
  static String socketUrl = Platform.isAndroid ? 'http://10.0.2.2:5193/api' : 'http://localhost:3000';
}