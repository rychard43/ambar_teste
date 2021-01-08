import 'dart:convert';
import 'package:ambar_teste/models/repo_model.dart';
import 'package:http/http.dart' as http;

class ApiGithub {

  Future<List<RepoModel>> getRepositories() async {
    List<RepoModel> list = List<RepoModel>();
    try {
      var responseBody;
      var response =
          await http.get("https://api.github.com/repositories");
      responseBody = json.decode(response.body);
      for (var repo in responseBody) {
        list.add(new RepoModel(
            repoName: repo["name"],
            userImage: repo["owner"]["avatar_url"],
            userName: repo["owner"]["login"],
            urlRepository: repo["html_url"]
        ));
      }
    } catch (e) {
      print(e);
    }
    return list;
  }
}
