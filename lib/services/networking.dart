import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {

  final String url;

  NetworkHelper(this.url);

  Future getdata() async
  {
    http.Response res = await  http.get(url);
    if(res.statusCode==200) {
      String dt=res.body;
      return jsonDecode(dt);
    }
    else
      print(res.statusCode);
  }
}