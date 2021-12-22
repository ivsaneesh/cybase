import 'dart:convert';

import 'package:cybase/core/health_model.dart';
import 'package:cybase/core/home_model.dart';
import 'package:http/http.dart' as http;

class HttpApi {
  Future<dynamic> homeApi() async {
    try {
      var uri = Uri.parse("http://143.110.240.107:8000/user/get_medfeed_home");
      Map<String, String> headers = {};
      headers['Authorization'] =
          "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYxMjVlZjVmZTVmNWMzOTYxNDI4NDIzYyIsImlhdCI6MTY0MDE3MDg2NSwiZXhwIjoxNjQyNzYyODY1fQ.o5-VC_lbWeFQxC5ffdazWEqf6GAB4VNcfdVMhVraYlg";
      Map<String, String> body = {};

      http.Response response =
          await http.get(uri,  headers: headers);

      var jsonData = json.decode(response.body);
      print("res >>>> $jsonData");
      var result = HomeModel.fromJson(jsonData);
      print("result >>>> ${result.message}");

      return result;
    } catch (err) {
      print("error >>>> $err");
    }
  }

  Future<dynamic> healthTipApi() async {
    try {
      var uri = Uri.parse("http://143.110.240.107:8000/user/get_health_tips");
      Map<String, String> headers = {
        "Authorization":
            "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYxMjVlZjVmZTVmNWMzOTYxNDI4NDIzYyIsImlhdCI6MTY0MDE3MDg2NSwiZXhwIjoxNjQyNzYyODY1fQ.o5-VC_lbWeFQxC5ffdazWEqf6GAB4VNcfdVMhVraYlg"
      };
      Map<String, String> body = {};

      http.Response response = await http.post(uri,body:jsonEncode(body), headers: headers);

      var jsonData = json.decode(response.body);
      print("res >>>> $jsonData");
      var result = HealthModel.fromJson(jsonData);
      return result;
    } catch (err) {
      rethrow;
    }
  }
}
