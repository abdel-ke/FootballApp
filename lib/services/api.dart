import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:football/constant/constants.dart';

api(String url) async {
  var headers = {
    'x-rapidapi-key': dotenv.env['x-rapidapi-key'].toString(),
    'x-rapidapi-host': xRapidapiHost
  };
  var request =
      http.Request('GET', Uri.parse('https://v3.football.api-sports.io/$url'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    var responseBody = await response.stream.bytesToString();
    var parsedJson = jsonDecode(responseBody);
    return parsedJson;
  } else {
    print('error : ${response.reasonPhrase}');
    return null;
  }
}