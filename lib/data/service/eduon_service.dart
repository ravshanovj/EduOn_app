import 'package:dio/dio.dart';
import 'package:eduon_app/data/model/eduon_model.dart';
class CurrencyService {
  Future<dynamic> getCurrency() async {
    try {
      Response response =
          await Dio().get("");

      if (response.statusCode == 200) {
        return (response.data as List)
            .map((e) => Course.fromJson(e))
            .toList();
      } else {
        return response.statusMessage.toString();
      }
    } on DioError catch (e) {
      return e.message.toString();
    }
  }
}
