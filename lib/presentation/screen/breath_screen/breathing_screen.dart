import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:sleeping_app/common/constant/constant_varaiable.dart';

class BreathingScreen extends StatefulWidget {
  const BreathingScreen({super.key, required this.breathIn, required this.breathOut, required this.step});
  final int breathIn;
  final int breathOut;
  final int step;
  @override
  State<BreathingScreen> createState() => _BreathingScreenState();
}

class _BreathingScreenState extends State<BreathingScreen> {
  Stream<int> breath4s() async* {
    bool breath = true;

    int i = 0;
    while (true) {
      if (i == (breath?widget.breathIn+1:widget.breathOut+1)) {
        breath = !breath;

        i = 0;
      } else {
        i++;
        await Future<void>.delayed(const Duration(seconds: 1));

      }
      // This will be displayed on the screen as current time
      yield i;
    }
  }

  Stream<bool> breathStrings() async* {
    bool breath = true;
    int step = widget.step;

    int i = 0;
    while (true) {
      if (i == (breath?widget.breathIn+1:widget.breathOut+1)) {
        breath = !breath;
        i = 0;
      } else {
        i++;
        await Future<void>.delayed(const Duration(seconds: 1));

      }
      // This will be displayed on the screen as current time
      yield breath;
    }
  }
  Stream<bool> complete() async* {
    bool breath = true;
    int i = 0;
    while (true) {
      await Future<void>.delayed(const Duration(seconds: 1));
      if (i <= 4*60) {

        i++;
      } else {
        breath = false;
        i=0;
      }
      yield breath;
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          title: const Text(
            'Tiếng thở',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
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
              SizedBox(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                         Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Hít vào ${widget.breathIn} giây - thở ra ${widget.breathOut} giây',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                        Center(
                          child: Container(
                            alignment: Alignment.center,
                            width: MediaQuery.sizeOf(context).width * 0.8,
                            height: MediaQuery.sizeOf(context).width * 0.8,
                            decoration: BoxDecoration(
                              gradient: const RadialGradient(tileMode: TileMode.decal, colors: [
                                purpleButton3,
                                purpleButton2,
                              ]),
                              borderRadius: BorderRadius.circular(75),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                StreamBuilder<bool>(
                                    stream: breathStrings(),
                                    builder: (context, snapshot) {
                                      return Text(
                                        snapshot.data == true ? 'Hít vào' : 'Thở ra',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w800,
                                          color: Colors.white,
                                          fontSize: 35,
                                        ),
                                      );
                                    }),
                                StreamBuilder<int>(
                                    stream: breath4s(),
                                    builder: (context, snapshot) {
                                      return Text(
                                        snapshot.data.toString(),
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w800,
                                          color: Colors.white,
                                          fontSize: 35,
                                        ),
                                      );
                                    }),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 70),
                        StreamBuilder<int>(
                            stream: breath4s(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Align(
                                  alignment: Alignment.center,
                                  child: LinearPercentIndicator(
                                    barRadius: const Radius.circular(10),
                                    width: MediaQuery.of(context).size.width * 0.9,
                                    animation: true,
                                    lineHeight: 30.0,
                                    animationDuration: 0,
                                    percent: 0.1 * num.parse(snapshot.data.toString()),
                                    progressColor: purpleButton1,
                                    backgroundColor: Colors.white,
                                  ),
                                );
                              } else {
                                return const SizedBox();
                              }
                            }),
                      ],
                    ),
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
