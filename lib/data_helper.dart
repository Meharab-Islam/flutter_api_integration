import 'package:api_int/data_model.dart';
import 'package:http/http.dart' as http;

class Data_helper {
  String api = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<Getdata>?> get_data() async {
    var response = await http.get(Uri.parse(api));
    if (response.statusCode == 200) {
      var json = response.body;
      return getdataFromJson(json);
    }
  }
}
