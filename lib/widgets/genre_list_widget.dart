import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gamezone/models/GameListResponse.dart';
import 'package:gamezone/models/GenreListResponse.dart';
import 'package:gamezone/models/Results.dart';
import 'package:gamezone/widgets/genre_item_widget.dart';
import 'package:transparent_image/transparent_image.dart';

import '../models/Album.dart';
import '../network/manager.dart';
import '../styles/AppTheme.dart';

class GenreListWidget extends StatefulWidget {
  const GenreListWidget({Key? key}) : super(key: key);

  @override
  State<GenreListWidget> createState() => _GenreListWidgetState();
}

class _GenreListWidgetState extends State<GenreListWidget> {
  late Future<GenreListResponse> futureGenreList;


  @override
  void initState() {
    super.initState();
    futureGenreList = NetworkManager().fetchGenreList();
  }

  @override
  Widget build(BuildContext context) {
    return _getGenres(context);
  }

  FutureBuilder<GenreListResponse> _getGenres(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 4;
    final double itemWidth = size.width / 2;

    return FutureBuilder(
      future: futureGenreList,
        builder: (context, snapshot) {
        if(snapshot.hasData){
          List<GenreResults> list = (snapshot.data!.results) as List<GenreResults>;
          return Expanded(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 2.0,
                    mainAxisSpacing: 2.0,
                    /*childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 4)*/),
                itemCount: list.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index){
                  return GenreWidget(
                      title: list[index].name.toString(),
                      image: list[index].imageBackground.toString());
                })


            /*child: GridView.count(
            // Create a grid with 2 columns. If you change the scrollDirection to
            // horizontal, this produces 2 rows.
            crossAxisCount: 2,
            childAspectRatio: (itemWidth / itemHeight),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            // Generate 100 widgets that display their index in the List.
            children: List.generate(list.length, (index) {
              return Wrap(children: [GenreWidget(
                  title: list[index].name.toString(),
                  image: list[index].imageBackground.toString())],);
            }),
          ),*/);
          // return Text(snapshot.data!.toString());
        }
        else if(snapshot.hasError){
          return Text(snapshot.error.toString());
        }
        else{
          return const CircularProgressIndicator();
        }
        });
  }
}