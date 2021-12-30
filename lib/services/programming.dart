import 'dart:convert';
import 'package:http/http.dart' as http;

//model for IT jokes
class ProgrammingJoke {
  final String itJoke;

  ProgrammingJoke({required this.itJoke});

  factory ProgrammingJoke.fromJson(Map<String, dynamic> json) {
    return ProgrammingJoke(
        itJoke: json['joke']
    );
  }
}

//convert json response to ProgrammingJoke object
Future<ProgrammingJoke> getItJoke() async {
  final responseIt = await http.get(Uri.parse('https://v2.jokeapi.dev/joke/Programming?type=single'));
  if (responseIt.statusCode == 200){
    return ProgrammingJoke.fromJson(jsonDecode(responseIt.body));
  }
  else {
    throw Exception('Unable to load IT joke');
  }
}