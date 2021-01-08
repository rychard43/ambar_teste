import 'package:ambar_teste/external/api_github.dart';
import 'package:ambar_teste/models/repo_model.dart';
import 'package:flutter_test/flutter_test.dart';

main(){
  
  test("ApiGithub", ()async{
    final apiGithub = ApiGithub();
    await apiGithub.getRepositories();
    expect(apiGithub.getRepositories(), isA<Future<List<RepoModel>>>());
  });
  
}