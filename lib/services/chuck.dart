import 'dart:convert';
import 'package:http/http.dart' as http;

//model for chuck
class Chuck {
  final String chuckJoke;

  Chuck({required this.chuckJoke});

  factory Chuck.fromJson(Map<String, dynamic> json) {
    return Chuck(
        chuckJoke: json['value']
    );
  }
}

//convert json response to chuck object
Future<Chuck> getChuckJoke() async {
  final responseChuck = await http.get(Uri.parse('https://api.chucknorris.io/jokes/random'));
  if (responseChuck.statusCode == 200){
    return Chuck.fromJson(jsonDecode(responseChuck.body));
  }
  else {
    throw Exception('Unable to load Chuck Norris joke');
  }
}