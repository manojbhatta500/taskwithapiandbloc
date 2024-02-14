import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:taskapibloc/home/model/dish_model_class.dart';

class GetDataRepository {
  var api =
      'http://docker16200-developer-test-ground.ktm.yetiappcloud.com/category/?format=json';

  Future<List<DishModelClass>> fetchdatafromserver() async {
    try {
      final response = await http.get(Uri.parse(api));
      if (response.statusCode == 200) {
        final body = json.decode(response.body) as List;

        return body.map((e) {
          return DishModelClass(
            id: e['id'] as String,
            name: e['name'] as String,
            status: e['status'] as String,
            products: (e['products'] as List<dynamic>)
                .map((product) => Products.fromJson(product))
                .toList(),
          );
        }).toList();
      } else {
        log("the status code is not 200 and it's problem");
        throw Exception('statuscode is not 200');
      }
    } catch (e) {
      throw Exception('error while fetching data : $e');
    }
  }
}
