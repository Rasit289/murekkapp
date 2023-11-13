import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../const.dart';
import '../drawer_widget.dart';

class KataegoriDagilimlari extends StatefulWidget {
  const KataegoriDagilimlari({super.key});

  @override
  State<KataegoriDagilimlari> createState() => _KataegoriDagilimlariState();
}

class _KataegoriDagilimlariState extends State<KataegoriDagilimlari> {
  final List<ChartData> chartData = [
    ChartData('David', 100, Colors.blue),
    ChartData(
      'Steve',
      38,
      Colors.green,
    ),
    ChartData('Jack', 34, Colors.purple),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: anaEkranColor,
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: const Text(
          'Kategori Dağılımları ',
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: anaEkranColor,
      drawer: const Drawer(
        child: DrawerWidget(),
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(0, 4, 0, 15),
        decoration: BoxDecoration(
          color:  Color.fromRGBO(53, 58, 64, 1),
        ),
        child: Column(
          children: [
            Container(
              child: Row(
                children: [
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 5, 0, 20),
                        height: 10,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(65, 0, 0, 20),
                        child: Text(
                          "Tahsil Edilmiş  ",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            //fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 5, 100, 20),
                        height: 10,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 54, 190, 93),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(62, 0, 0, 20),
                        child: Text(
                          "Kısmi Tahsil Edilmiş",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            //fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(10, 5, 100, 0),
                  height: 10,
                  width: 50,
                  decoration: BoxDecoration(color: Colors.purple),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(63, 0, 0, 0),
                  child: Text(
                    "Tahsil Edilmemiş",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      //fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ],
            ),
            Container(
              child: SfCircularChart(series: <CircularSeries>[
                // Render pie chart
                PieSeries<ChartData, String>(
                    dataSource: chartData,
                    pointColorMapper: (ChartData data, _) => data.color,
                    xValueMapper: (ChartData data, _) => data.x,
                    yValueMapper: (ChartData data, _) => data.y)
              ]),
            ),
            Container(

                 margin: const EdgeInsets.fromLTRB(0, 7, 0, 7),
                    height: 45,
                    padding: EdgeInsets.all(5),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Colors.white,
                      ),
                    ),

                 child:   Stack(
                  children: [
                     Text(
              "Tahsil Edilen",
              textAlign: TextAlign.left,
              style: TextStyle(
                
                fontSize: 16,
                color: Colors.white,
                //fontWeight: FontWeight.bold
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(320, 0, 0, 0),
              child:          Text(
              "0.00  ₺ ",
              textAlign: TextAlign.left,
              style: TextStyle(
                
                fontSize: 16,
                color: Colors.white,
                //fontWeight: FontWeight.bold
              ),
            ),
            )
                  ],
                 ),

              

            
            ),
               Container(

                 margin: const EdgeInsets.fromLTRB(0, 7, 0, 7),
                    height: 45,
                    padding: EdgeInsets.all(5),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Colors.white,
                      ),
                    ),

            child:   Stack(
                  children: [
                     Text(
              "Kısmı Tahsil Edilen",
              textAlign: TextAlign.left,
              style: TextStyle(
                
                fontSize: 16,
                color: Colors.white,
                //fontWeight: FontWeight.bold
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(320, 0, 0, 0),
              child:          Text(
              "0.00  ₺ ",
              textAlign: TextAlign.left,
              style: TextStyle(
                
                fontSize: 16,
                color: Colors.white,
                //fontWeight: FontWeight.bold
              ),
            ),
            )
                  ],
                 ),
            ),
               Container(

               margin: const EdgeInsets.fromLTRB(0, 7, 0, 7),
                    height: 45,
                    padding: EdgeInsets.all(5),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Colors.white,
                      ),
                    ),
   child:   Stack(
                  children: [
                     Text(
              "Tahsil Edilmeyen",
              textAlign: TextAlign.left,
              style: TextStyle(
                
                fontSize: 16,
                color: Colors.white,
                //fontWeight: FontWeight.bold
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(320, 0, 0, 0),
              child:          Text(
              "0.00  ₺ ",
              textAlign: TextAlign.left,
              style: TextStyle(
                
                fontSize: 16,
                color: Colors.white,
                //fontWeight: FontWeight.bold
              ),
            ),
            )
                  ],
                 ),
            ),
       
          
          ],
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  final double y;
  final Color? color;
}
