import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:jointeam/services/apiUrls.dart';

class Api {
  Dio dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      contentType: "application/json",
      // headers: {'Content-Type': 'application/x-www-form-urlencoded'},
    ),
  );

  // Future<Response> get(String url, {Object? payload}) async {
  //   return dio.get(url, data: payload);
  // }

  Future<Response> post(String url, {Object? payload}) async {
    final data = {
      'number': '9065546703',
    };
    // final encodedData =
    //     Uri.parse(data.entries.map((e) => '${e.key}=${e.value}').join('&'));

    if (payload is FormData) {
      log("Request Body-- ${payload.fields} ${payload.files}");
    } else {
      log("Request Body-- ${payload}");
    }
    log("Request API-- ${url}");

    return dio.post(
      url,
      data: payload,
    );
  }
}
