import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

void main() {
  FlutterError.onError = (FlutterErrorDetails details) async {
    final exceptionData = {
      'message': details.exception.toString(),
      'stackTrace' : details.stack.toString(),
    };
    await postExceptionData(exceptionData);

  };
}

Future<void> postExceptionData(Map<String, dynamic> data) async {
  const apiUrl = 'https://seq.shielddatasolutions.com/#/events';
  final headers = {'Content-Type' : 'application/json'};
  final body = json.decode(data as String);

  final response = await http.post(apiUrl as Uri, headers: headers, body: body);
  
  if (response.statusCode == 200) {
    print('Exception Data Sent Successfully!');
  } else {
    print('Failed To Send Exception Data!');
  }
  }