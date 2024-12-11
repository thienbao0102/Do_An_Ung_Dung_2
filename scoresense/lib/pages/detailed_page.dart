import 'package:flutter/material.dart';
import 'package:scoresense/module/data_detail_table.dart';

class DetailedPage extends StatefulWidget {
  final List<List<String>> data;

  const DetailedPage({super.key, required this.data});

  @override
  _DetailedPageState createState() => _DetailedPageState();
}

class _DetailedPageState extends State<DetailedPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomTable(data: widget.data),
    );
  }
}