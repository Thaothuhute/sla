import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import 'package:sleeping_app/common/constant/constant_varaiable.dart';
import 'package:sleeping_app/presentation/screen/sleeping_screen/sleeping_screen.dart';

class ChoosingTime extends StatefulWidget {
  const ChoosingTime({super.key, required this.optionSleep});
  final bool optionSleep;

  @override
  State<ChoosingTime> createState() => _ChoosingTimeState();
}

class _ChoosingTimeState extends State<ChoosingTime> {


  late List<DateTime> times;
  @override
  void initState() {
    int timeEnd = widget.optionSleep ? 4 : 10;
    DateTime timeCurrent = DateTime.now();
    times = [];
    for (int i = widget.optionSleep ? 0 : 5; i < timeEnd; i++) {
      times.add(timeCurrent.add(Duration(minutes: i * 90)));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white.withOpacity(0.2),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          child: Stack(
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height,
                decoration: const BoxDecoration(color: Colors.transparent),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.cancel_outlined)),
                  ],
                ),
              ),
              Positioned(
                  top: 50,
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.7,
                    height: MediaQuery.sizeOf(context).height,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const Text(
                            'Chọn giờ thức giấc',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.yellow,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const Divider(),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.7,
                            height: MediaQuery.sizeOf(context).height,
                            child: GridView.builder(
                              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 150,
                                  childAspectRatio: 3 / 2,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20),
                              itemBuilder: (BuildContext builder, index) {
                                return choosingTime(
                                    '${times[index].hour.toString()}h${times[index].minute.toString()}m',times[index]);
                              },
                              itemCount: times.length,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget choosingTime(String content,DateTime wakeTime) {
    return InkWell(
      onTap: () async{
        await Alarm.init();

        final alarmSettings = AlarmSettings(
          id: 42,
          assetAudioPath: 'assets/ringtune2.mp3',
          // dateTime: wakeTime,
          dateTime: DateTime.now().add(Duration(seconds: 5)),
          loopAudio: true,
          vibrate: true,
          volume: 0.8,
          fadeDuration: 3.0,
          notificationTitle: 'Sleeping app',
          notificationBody: 'Bạn đã hoàn thành giấc ngủ',
          enableNotificationOnKill: false ,
        );
        await Alarm.set(alarmSettings: alarmSettings);
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>  SleepingScreen(wakeTime: wakeTime)));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: purpleButton1,
        ),
        width: MediaQuery.sizeOf(context).width * 0.1,
        height: MediaQuery.sizeOf(context).height * 0.05,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            content,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
