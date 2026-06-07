import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ResultsView extends StatefulWidget {

  const ResultsView({
    Key? key,
  }) : super(key: key);

  @override
  State<ResultsView> createState() => _ResultsViewState();
}

class _ResultsViewState extends State<ResultsView> {
  String _data = '';

  @override
  void initState() {
    super.initState();
    _loadResults();
  }

  Future<void> _loadResults() async {
    var sheetId = "1_kMhYL_H_xVGIYDLPLjKJJ_DlX2iFVvaB7Czn7JkVU8";
    var sheetName = "Sheet1";
    final response = await Dio().get("https://docs.google.com/spreadsheets/d/$sheetId/gviz/tq?sheet=$sheetName&tqx=out:json");
    final data = response.data;
    setState(() {
      _data = data.toString();
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View results"),
      ),
      body: ListView(
        children: [
         Text(_data)
        ]
      ),
    );
  }
}
