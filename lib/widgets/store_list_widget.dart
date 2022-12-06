import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StoreListWidget extends StatefulWidget {
  const StoreListWidget({Key? key}) : super(key: key);

  @override
  State<StoreListWidget> createState() => _StoreListWidgetState();
}

class _StoreListWidgetState extends State<StoreListWidget> {
  // late Future<GenreListResponse> futureGenreList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildStoreList(context),
    );
  }

  Widget buildStoreList(BuildContext context) {
    return FutureBuilder(
      future: getStoreList(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {

      },
    );
  }
}
