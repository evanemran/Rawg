import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gamezone/models/Ratings.dart';
import 'package:gamezone/styles/AppColors.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../models/Results.dart';

class GameDetailPage extends StatefulWidget {
  const GameDetailPage({Key? key, required this.game}) : super(key: key);

  final Results game;

  @override
  State<GameDetailPage> createState() => _GameDetailPageState();
}

class _GameDetailPageState extends State<GameDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: double.maxFinite,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        widget.game.backgroundImage.toString()),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(0.0),
                  ),
                ),
                child: Container(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  color: Colors.black54,
                ),
              ),
              Positioned(
                child: Row(children: [Expanded(child: Text(widget.game.name.toString(), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22), textAlign: TextAlign.center,),)],),)
            ],
          ),
          Card(
            margin: const EdgeInsets.all(10),
            color: AppColors.greyAccent,
            child: SfCircularChart(
                title: ChartTitle(text: "Rating Breakdown", textStyle: const TextStyle(color: Colors.white, fontSize: 18)),
                //legend: Legend(isVisible: true, position: LegendPosition.bottom, overflowMode: LegendItemOverflowMode.none),
                series: <CircularSeries>[
                  PieSeries<Ratings, String>(
                      enableTooltip: true,
                      dataSource: widget.game.ratings,
                      xValueMapper: (Ratings data, _) => data.id.toString(),
                      yValueMapper: (Ratings data, _) => data.percent,
                      // starting angle of pie
                      startAngle: 270,
                      explode: true,
                      dataLabelSettings: const DataLabelSettings(isVisible: true, ),
                      // ending angle of pie
                      endAngle: 90
                  )
                ]
            ),
          )
        ],
      ),
    );
  }
}
