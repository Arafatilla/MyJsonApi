import 'dart:convert';
import '../models/post.dart';
import 'package:http/http.dart' as http;

class RemoteSevice {


  // function that fetches the data from the MyJsonApi
  Future<List<Post>?> getPost() async {

    var client = http.Client();
    var uri = Uri.parse("https://my-json-server.typicode.com/typicode/demo/posts");

    try {
      var response = await client.get(uri);

      if (response.statusCode == 200) {

        var jsonData = response.body;
        return postFromJson(jsonData);
      }
      if (response.statusCode == 404) {

        print("Error 404: Not Found - The resource does not exist.");

      }
    } catch (e) {
      print("Error fetching data: $e");
    }


    return null;
  }
}
