import 'dart:convert';
import 'package:http/http.dart' as http;

//model for dad
class DadJoke {
  final String dadJoke;

  DadJoke({required this.dadJoke});

  factory DadJoke.fromJson(Map<String, dynamic> json) {
    return DadJoke(
        dadJoke: json['joke']
    );
  }
}

//convert json response to dad object
Future<DadJoke> getDadJoke() async {
  final responseDad = await http.get(Uri.parse('https://icanhazdadjoke.com/'), headers: {"Accept": "application/json"});
  if (responseDad.statusCode == 200){
    return DadJoke.fromJson(jsonDecode(responseDad.body));
  }
  else {
    throw Exception("Unable to load a dad's joke");
  }
}