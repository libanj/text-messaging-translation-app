import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class GoogleTranslate {
  
  Future<String> callApi(resultText) async {
    final RemoteConfig remoteConfig = await RemoteConfig.instance;
    await remoteConfig.fetch(expiration: const Duration(hours: 1));
    await remoteConfig.activateFetched();

    String key = remoteConfig.getValue('api_key').asString();
    print(key);

    String url = 'https://translation.googleapis.com/language/translate/v2?target=es&key=$key&q=$resultText';

    var response = await http.post(url, body: "");

    Map<String, dynamic> result = jsonDecode(response.body);
    print(result);
    var data = result['data'];
    print(data);
    var translations = data['translations'][0];
    String text = translations['translatedText'];

    return text;
  }
}