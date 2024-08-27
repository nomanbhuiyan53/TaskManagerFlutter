import 'dart:convert';

import 'package:http/http.dart';
import 'package:tasksystem/data/models/network_response.dart';

class NetworkCaller {
  static Future<NetworkResponse> getRequest(String url) async {
    try {
      Response response = await get(Uri.parse(url));
      if (response.statusCode == 200) {
        final decodedData = jsonDecode(response.body);
        return NetworkResponse(statusCode: response.statusCode,
            responseData: decodedData, isSuccess: true);
      } else {
        return NetworkResponse(statusCode: response.statusCode,
            responseData: null, isSuccess: false);
      }
    } catch (e) {
      return NetworkResponse(statusCode: -1, responseData: null,
          isSuccess: false,errorMessage: e.toString());
    }
  }
  // post method get
 static Future<NetworkResponse> postRequest(String url, Map<String, dynamic> body) async {
    try{
      Response response = await post(Uri.parse(url),
        body: jsonEncode(body),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final decodedData = jsonDecode(response.body);
        return NetworkResponse(statusCode: response.statusCode,
            responseData: decodedData, isSuccess: true);
      }else{
        return NetworkResponse(statusCode: response.statusCode,
            responseData: null, isSuccess: false);
      }
    }catch(e){
      return NetworkResponse(statusCode: -1, responseData: null,
          isSuccess: false,errorMessage: e.toString());
    }
  }
}