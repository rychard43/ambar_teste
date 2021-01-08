import 'package:flutter/material.dart';


class RepoCard extends StatelessWidget {
  final String repoName;
  final String userName;
  final String userImage;

  RepoCard(this.repoName, this.userName, this.userImage);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: Colors.white,
      child: Container(
        height: 130,
        child: Row(
          children: [
            Container(
              height: 100,
              width: 100,
                child: CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage(userImage),
                  backgroundColor: Colors.transparent,
                ),
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8, top: 15),
                    child: Text(
                      repoName,
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, left: 8),
                    child: Text(
                      userName,
                      style: TextStyle(fontSize: 20, ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
