import 'dart:convert';
import 'package:http/http.dart' as http;

//model for corporate bs
class CorporateGenerator {
  final String corporateBs;

  CorporateGenerator({required this.corporateBs});

  factory CorporateGenerator.fromJson(Map<String, dynamic> json) {
    return CorporateGenerator(
        corporateBs: json['phrase']
    );
  }
}

//convert json response to corporate object
Future<CorporateGenerator> getCorporateBs() async {
  final responseCorp = await http.get(Uri.parse('https://corporatebs-generator.sameerkumar.website'));
  if (responseCorp.statusCode == 200){
    return CorporateGenerator.fromJson(jsonDecode(responseCorp.body));
  }
  else {
    throw Exception('Unable to load corporate BS');
  }
}