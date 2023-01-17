import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<dynamic>> fetchCategories() async {
  var result = await http.get(Uri.parse(
      "https://bpac.in/b-safe-constituency/cgi/getQuestionsCategory.php"));
  return jsonDecode(result.body);
}

Future<List<dynamic>> fetchQuestions(int category) async {
  Map data = {
    'category': category,
    'version': 1,
  };
  var body = json.encode(data);
  var result = await http.post(
    Uri.parse(
        "https://bpac.in/b-safe-constituency/cgi/getQuestionsbyCategory.php"),
    body: body,
  );
  return jsonDecode(result.body);
}
