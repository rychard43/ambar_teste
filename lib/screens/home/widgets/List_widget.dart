import 'package:ambar_teste/external/api_github.dart';
import 'package:ambar_teste/models/repo_model.dart';
import 'package:ambar_teste/screens/home/widgets/repo_card.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ListWidget extends StatefulWidget {
  @override
  _ListWidgetState createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  List<RepoModel> models = List<RepoModel>();
  ApiGithub api = ApiGithub();

  Future getRepositories()async{
    models = await api.getRepositories();
  }

    launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getRepositories(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (models.isNotEmpty) {
          return ListView.builder(
            itemCount: models.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => launchURL(models[index].urlRepository),
                child: RepoCard(models[index].repoName, models[index].userName,
                    models[index].userImage),
              );
            },
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
