import 'package:http/http.dart';
import 'dart:convert';

class FetchMeme {
  static fetchnewMeme() async {
    Response response = await get(
      Uri.parse(
        "https://meme-api.com/gimme/wholesomememes",

        //"https://meme-api.com/gimme/wholesomememes",
        //"https://meme-api.com/gimme",
      ),
    );
    print(response);

    Map body_data = jsonDecode(response.body);
    print(body_data["url"]);
    return body_data["url"];
  }
}
