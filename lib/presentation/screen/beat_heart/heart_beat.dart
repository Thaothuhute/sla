import 'package:flutter/material.dart';
import 'package:heart_bpm/chart.dart';
import 'package:heart_bpm/heart_bpm.dart';


class HeartLayoutScreen extends StatefulWidget {
  const HeartLayoutScreen({super.key});

  @override
  State<HeartLayoutScreen> createState() => _HeartLayoutScreenState();
}

class _HeartLayoutScreenState extends State<HeartLayoutScreen> {
  List<SensorValue> data = [];
  List<SensorValue> bpmValues = [];

  int bpmValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Đo nhịp tim',style: TextStyle(
          color: Colors.white,
        ),),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Color(0xFF401A5D),
      body: Column(
        children: [
          HeartBPMDialog(
            context: context,
            showTextValues: true,
            borderRadius: 10,
            onRawData: (value) {
              setState(() {
                if (data.length >= 100) data.removeAt(0);
                data.add(value);
              });
              // chart = BPMChart(data);
            },
            onBPM: (value) => setState(() {
              if (bpmValues.length >= 100) bpmValues.removeAt(0);
              bpmValues.add(SensorValue(
                  value: value.toDouble(), time: DateTime.now()));
            }),
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 8.0),
                  // Hình trái tim
                  Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 100.0,
                  ),
                  data.isNotEmpty
                      ? Container(
                    decoration: BoxDecoration(border: Border.all()),
                    height: 180,
                    child: BPMChart(data),
                  )
                      : SizedBox(),
                  SizedBox(height: 8.0),
                  // Đoạn văn bản dưới trái tim
                  Text(
                    'Đưa ngón tay vào để tiến hành đo',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('nhip tim ${bpmValue}',style: TextStyle(color: Colors.white),),
                  bpmValues.isNotEmpty
                      ? Container(
                    decoration: BoxDecoration(border: Border.all()),
                    constraints: BoxConstraints.expand(height: 180),
                    child: BPMChart(bpmValues),
                  )
                      : SizedBox(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}