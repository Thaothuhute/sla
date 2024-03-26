import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:alarm/alarm.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sleeping_app/common/constant/constant_varaiable.dart';
import 'package:sleeping_app/data/model/option.dart';

class SleepingScreen extends StatefulWidget {
  const SleepingScreen({super.key, required this.wakeTime});
  final DateTime wakeTime;

  @override
  State<SleepingScreen> createState() => _SleepingScreenState();
}

class _SleepingScreenState extends State<SleepingScreen> {

  Future<void> loadMusic() async{
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? user = prefs.getString('userId');
    DocumentSnapshot documentSnapshot = await firestore.collection('option').doc(user).get();
    final player = AudioPlayer();
    Option option = Option.fromJson(documentSnapshot.data() as Map<String,dynamic>);
    await player.play(AssetSource(option.musicPath),);
  }
  Stream<String> _clock() async* {
    while (true) {
      await Future<void>.delayed(const Duration(seconds: 1));
      DateTime now = DateTime.now();
      // This will be displayed on the screen as current time
      yield "${now.hour} : ${now.minute}";
    }
  }
  @override
  void initState() {
    loadMusic();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.black, purpleButton1]))),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      StreamBuilder(
                          stream: _clock(),
                          builder: (context, snapshot) {
                            return Container(
                              width: MediaQuery.sizeOf(context).width,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(horizontal: 80),
                              child: Text(
                                "${snapshot.data}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            );
                          }),
                       Row(
                        mainAxisAlignment:  MainAxisAlignment.center,
                        children: [
                          InkWell(onTap: ()async{
                            await Alarm.stop(42);
                          },child: ElevatedButton(onPressed: ()async{
                            await Alarm.stop(42);

                          },child: const Icon(Icons.alarm,color: Colors.white,))),
                          const Text(
                            'Tắt',
                            style:TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ) ,
                          )
                        ],
                      ),
                      const SizedBox(height: 50,),

                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white.withOpacity(0.2),
                        ),
                        padding: const EdgeInsets.all(16),
                        child: const Row(
                          children: [
                            SizedBox(
                              height: 40,
                              width: 40,
                              child: Image(
                                image: AssetImage('assets/moon.png'),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Giám sát giấc ngủ',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.watch_later_outlined,
                                      size: 12,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 3),
                                    Text(
                                      '00:00',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Spacer(),
                            Icon(Icons.play_arrow_rounded,color: Colors.white,),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
