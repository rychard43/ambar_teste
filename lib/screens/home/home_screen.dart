import 'package:ambar_teste/screens/home/widgets/List_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GitHub Repos"),
        centerTitle: true,
      ),

      body: ListWidget(),
    );
  }
}
