import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../utils/constant_graph.dart';

import '../models/global_summary.dart';

class GlobalStatistics extends StatelessWidget {

  final GlobalSummaryModel summary;

  GlobalStatistics({@required this.summary});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[

        buildCard(
          "Confirmados", 
          summary.totalConfirmed,
          summary.newConfirmed,
          kConfirmedColor
        ),

        buildCard(
          "Activos", 
          summary.totalConfirmed - summary.totalRecovered - summary.totalDeaths,
          summary.newConfirmed - summary.newRecovered - summary.newDeaths,
          kActiveColor
        ),

        buildCard(
          "Recuperados", 
          summary.totalRecovered,
          summary.newRecovered,
          kRecoveredColor
        ),

        buildCard(
          "Muertes", 
          summary.totalDeaths,
          summary.newDeaths,
          kDeathColor
        ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 6),
          child: Text(
            "Datos actualizados cada día.", //+ timeago.format(summary.date),
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),

      ],
    );
  }

  Widget buildCard(String title, int totalCount, int todayCount, Color color){
    return Card(
      elevation: 1,
      child: Container(
        height: 100,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: <Widget>[

            Text(
              title,
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),

            Expanded(
              child: Container(),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    Text(
                      "Totales",
                      style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),

                    Text(
                      totalCount.toString().replaceAllMapped(reg, mathFunc),
                      style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),

                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[

                    Text(
                      "Hoy",
                      style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),

                    Text(
                      todayCount.toString().replaceAllMapped(reg, mathFunc),
                      style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),

                  ],
                ),

                
              ],
            ),
          ],
        ),
      ),
    );
  }
}