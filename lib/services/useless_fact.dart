import 'dart:convert';
import 'package:http/http.dart' as http;

//model for useless fact
class UselessFact {
  final String uselessFact;

  UselessFact({required this.uselessFact});

  factory UselessFact.fromJson(Map<String, dynamic> json) {
   return UselessFact(
     uselessFact: json['text']       
   );
  }
}

//convert json response to UselessFact object
Future<UselessFact> getUselessFact() async {
  final response = await http.get(Uri.parse('https://uselessfacts.jsph.pl/random.json?language=en'));
  if (response.statusCode == 200){
   return UselessFact.fromJson(jsonDecode(response.body));
  }
  else {
    throw Exception('Unable to load useless fact');
  }
}