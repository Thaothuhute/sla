import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:sleeping_app/common/constant/constant_varaiable.dart';

class SuperviseScreenDay extends StatefulWidget {
  const SuperviseScreenDay({super.key});

  @override
  State<SuperviseScreenDay> createState() => _SuperviseScreenDayState();
}

class _SuperviseScreenDayState extends State<SuperviseScreenDay> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                ),
                Text(
                  '12 - 24 - 2023',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            alignment: Alignment.topCenter,
            width: MediaQuery.sizeOf(context).width * 0.5,
            height: MediaQuery.sizeOf(context).width * 0.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: purpleButton1,
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    width: MediaQuery.sizeOf(context).width * 0.5,
                    alignment: Alignment.topCenter,
                    child: const CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 10,
                      backgroundImage: AssetImage('assets/sleeping.png'),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  child: Container(
                    alignment: Alignment.center,
                    height: MediaQuery.sizeOf(context).width * 0.5,
                    width: MediaQuery.sizeOf(context).width * 0.5,
                    child: Container(
                      height: MediaQuery.sizeOf(context).width * 0.39,
                      width: MediaQuery.sizeOf(context).width * 0.39,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  child: Container(
                      alignment: Alignment.center,
                      height: MediaQuery.sizeOf(context).width * 0.5,
                      width: MediaQuery.sizeOf(context).width * 0.5,
                      child: CircularPercentIndicator(
                        backgroundColor: const Color(0xFF301f2d),
                        circularStrokeCap: CircularStrokeCap.round,
                        radius: 73.0,
                        animation: true,
                        lineWidth: 20,
                        percent: 0.70,
                        center: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '70',
                              style: TextStyle(
                                  color: Color(0xffd6f3ff),
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'Điểm ngủ',
                              style: TextStyle(
                                  color: Color(0xff8798a0),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        progressColor: purpleButton2,
                      )),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Bạn có 1 giấc ngủ ngon',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
                'chúc mừng bạn đã có một giấc ngủ ngon, điều này giúp ích cho thể lực của bạn',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                  fontSize: 15,
                ),
                textAlign: TextAlign.center),
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xfff787ff),
                  ),
                  width: MediaQuery.sizeOf(context).width * 0.5,
                  height: MediaQuery.sizeOf(context).height * 0.15,
                  child: Stack(
                    children: [
                      const Positioned(
                        top: 5,
                        left: 10,
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'CHẤT LƯỢNG',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '78%',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 35,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                          bottom: 10,
                          left: 0,
                          child: GestureDetector(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: LinearPercentIndicator(
                                barRadius: const Radius.circular(10),
                                width: MediaQuery.of(context).size.width * 0.45,
                                animation: true,
                                lineHeight: 15.0,
                                animationDuration: 2500,
                                percent: 0.8,
                                progressColor: purpleButton1,
                                backgroundColor: Colors.white,
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xfff787ff),
                  ),
                  width: MediaQuery.sizeOf(context).width * 0.4,
                  height: MediaQuery.sizeOf(context).height * 0.15,
                  child: Stack(
                    children: [
                      const Positioned(
                        top: 5,
                        left: 10,
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'THỜI LƯỢNG',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '78%',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 35,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                          bottom: 10,
                          left: 0,
                          child: GestureDetector(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: LinearPercentIndicator(
                                barRadius: const Radius.circular(10),
                                width: MediaQuery.of(context).size.width * 0.35,
                                animation: true,
                                lineHeight: 15.0,
                                animationDuration: 2500,
                                percent: 0.8,
                                progressColor: purpleButton1,
                                backgroundColor: Colors.white,
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.3,
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.end,

                    children: [
                      SizedBox(
                        width: 30,
                        height: 30,

                        child: Image(image: AssetImage('assets/sleep.png')),
                      ),
                      SizedBox(width:  10,),
                      Text('11:06 pm',style: TextStyle(
                        fontWeight: FontWeight.w200,
                        color: Colors.white,
                      ),)
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.3,
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.end,

                    children: [
                      SizedBox(
                        width: 30,
                        height: 30,

                        child: Image(image: AssetImage('assets/sun.png')),
                      ),
                      SizedBox(width:  10,),
                      Text('9:05 am',style: TextStyle(
                        fontWeight: FontWeight.w200,
                        color: Colors.yellow,
                      ),

                      )
                    ],
                  ),
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
}
