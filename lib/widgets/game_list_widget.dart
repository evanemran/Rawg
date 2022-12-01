import 'package:flutter/material.dart';
import 'package:gamezone/models/GameListResponse.dart';
import 'package:gamezone/models/Results.dart';
import 'package:gamezone/styles/AppColors.dart';
import 'package:transparent_image/transparent_image.dart';
import '../network/manager.dart';
import '../styles/AppTheme.dart';

class GameListWidget extends StatefulWidget {
  const GameListWidget({Key? key}) : super(key: key);

  @override
  State<GameListWidget> createState() => _GameListWidgetState();
}

class _GameListWidgetState extends State<GameListWidget> {
  late Future<GameListResponse> futureGameList;

  @override
  void initState() {
    super.initState();
    futureGameList = NetworkManager().fetchGameList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text("List"),
      ),*/
      body: Center(child: _getAlbum(context)),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  FutureBuilder<GameListResponse> _getAlbum(BuildContext context) {
    return FutureBuilder(
        future: futureGameList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Results> list = (snapshot.data!.results) as List<Results>;
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: ListView.builder(
                itemCount: list.length,
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.all(8),
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.all(8.0),
                    decoration: const BoxDecoration(
                      color: AppColors.greyAccent,
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                list[index].name.toString(),
                                style: AppTheme.titleText,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 150,
                              height: 120,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      list[index].backgroundImage.toString()),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                              ),
                              /*child: FadeInImage.memoryNetwork(
                              image: list[index].backgroundImage.toString(),
                              width: 150,
                              height: 120,
                              placeholder: kTransparentImage,
                              imageErrorBuilder:
                                  (context, error, stackTrace) {
                                return Image.asset(
                                    'assets/images/flag_placeholder.jpg',
                                    width: 80,
                                    height: 50,
                                    fit: BoxFit.fitWidth);
                              },
                              fit: BoxFit.fitHeight,
                            ),*/
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                                child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                        child: Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 8, 0, 8),
                                      child: Text(
                                        "Released: ${list[index].released}",
                                        style: AppTheme.ntitleText,
                                        textAlign: TextAlign.start,
                                      ),
                                    ))
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star_border,
                                      color: Colors.amber,
                                      size: 16,
                                    ),
                                    Expanded(
                                        child: Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(8, 8, 0, 8),
                                      child: Text(
                                        "${list[index].rating.toString()} / ${list[index].ratingTop.toString()}",
                                        style: AppTheme.nbodyText,
                                        textAlign: TextAlign.start,
                                      ),
                                    ))
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.access_time,
                                      color: Colors.amber,
                                      size: 14,
                                    ),
                                    Expanded(
                                        child: Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(8, 8, 0, 8),
                                      child: Text(
                                        "Playtime: ${list[index].playtime.toString()}hrs",
                                        style: AppTheme.nbodyText,
                                        textAlign: TextAlign.start,
                                      ),
                                    ))
                                  ],
                                ),
                              ],
                            ))
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            );
            // return Text(snapshot.data!.toString());
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
