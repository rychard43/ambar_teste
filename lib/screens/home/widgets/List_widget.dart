import 'dart:async';

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
  bool errorList = false;
  int _state = 0;

  @override
  void initState() {
    super.initState();
    getRepositories();
  }

  Future getRepositories() async {
    models = await api.getRepositories();
    if (models.isEmpty) {
      errorList = true;
    } else {
      errorList = false;
    }
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
      future: api.getRepositories(),
      builder: (BuildContext context, AsyncSnapshot<List<RepoModel>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            errorList == false) {
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
        } else if (errorList == true) {
          return Center(
            child:  new Padding(
              padding: const EdgeInsets.all(16.0),
              child: new MaterialButton(
                child: setUpButtonChild(),
                onPressed: () {
                  setState(() {
                    if (_state == 0) {
                      animateButton();
                    }
                    getRepositories();
                  });
                },
                elevation: 4.0,
                minWidth: double.infinity,
                height: 48.0,
                color: Colors.blue,
              ),
            )
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget setUpButtonChild() {
    if (_state == 0) {
      return new Text(
        "Error, tap to retry",
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      );
    } else if (_state == 1) {
      return CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      );
    }

  }

  void animateButton() {
    setState(() {
      _state = 1;
    });

    Timer(Duration(milliseconds: 3300), () {
      setState(() {
        _state = 0;
      });
    });
  }
}


