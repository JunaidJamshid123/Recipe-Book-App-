import 'package:recepie_app/Recipe.dart';
import 'Http_service.dart';

class DataService {
  static final DataService _singleton = DataService._internal();
  final HttpService _httpService = HttpService();

  factory DataService() {
    return _singleton;
  }

  DataService._internal();

  Future<List<Recipie>?> getRecipes() async {
    String path = 'https://dummyjson.com/recipes/';
    try {
      var response = await _httpService.get(path);
      if (response.statusCode == 200) {
        List<dynamic> data = response.data['recipes'];
        List<Recipie> recipes =
            data.map((json) => Recipie.fromJson(json)).toList();
        return recipes;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
