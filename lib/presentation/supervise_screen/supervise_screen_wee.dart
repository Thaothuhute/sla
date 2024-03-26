import 'package:flutter/material.dart';
import 'package:sleeping_app/common/constant/constant_varaiable.dart';
import 'package:sleeping_app/presentation/widget/grahp_widget.dart';

class SuperviseScreenWeek extends StatefulWidget {
  const SuperviseScreenWeek({super.key});

  @override
  State<SuperviseScreenWeek> createState() => _SuperviseScreenWeekState();
}

class _SuperviseScreenWeekState extends State<SuperviseScreenWeek> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Tuần này',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: RichText(
                textAlign: TextAlign.start,
                text: const TextSpan(
                    text: '7',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 40,
                    ),
                    children: [
                      TextSpan(
                        text: ' h ',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: '22',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 40,
                        ),
                      ),
                      TextSpan(
                        text: ' m ',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ]),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('Thời lượng trung binh',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.left),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.sizeOf(context).width,
              height: 90,
              decoration: BoxDecoration(
                color: purpleButton3,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: 80,
                    padding: const EdgeInsets.all(16),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '70%',
                          style: TextStyle(
                              color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Đúng giấc',
                          style: TextStyle(
                              color: Colors.white, fontSize: 15, fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: purpleButton1,
                    ),
                    width: MediaQuery.sizeOf(context).width * 0.65,
                    height: 100,
                    padding: const EdgeInsets.all(16),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '70%',
                          style: TextStyle(
                              color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Thời lượng',
                          style: TextStyle(
                              color: Colors.white, fontSize: 15, fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: purpleButton2,
                    ),
                    width: MediaQuery.sizeOf(context).width * 0.35,
                    height: 100,
                    padding: const EdgeInsets.all(16),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '70%',
                          style: TextStyle(
                              color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Trung bình ngủ',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.white, fontSize: 15, fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: backgroundColor,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '100h23m',
                    style: TextStyle(
                      color: mainTextColor2,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const LineChartSample2(),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.5,
                        decoration: BoxDecoration(
                          color: backgroundColor2,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 20,
                              width: 30,
                              decoration: BoxDecoration(
                                color: contentColorBlue,
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              'Chỉ số',
                              style: TextStyle(
                                fontSize: 10,
                                color: mainTextColor2,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                              height: 20,
                              width: 30,
                              decoration: BoxDecoration(
                                color: purpleButton2,
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              'Ngày',
                              style: TextStyle(
                                fontSize: 10,
                                color: mainTextColor2,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                          ],
                        )),
                  )
                ],
              ),
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              decoration: BoxDecoration(
                color: boxContentColor,
                borderRadius: BorderRadius.circular(20),
              ),
              width: MediaQuery.sizeOf(context).width - 32,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      height: 50,
                      width: 50,
                      child: Image(
                        image: AssetImage('assets/sleep.png'),
                      )),
                  SizedBox(height: 10),
                  Text(
                    '46 giờ ngủ',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Tổng giờ ngủ',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              decoration: BoxDecoration(
                color: boxContentColor,
                borderRadius: BorderRadius.circular(20),
              ),
              width: MediaQuery.sizeOf(context).width - 32,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      height: 50,
                      width: 50,
                      child: Image(
                        image: AssetImage('assets/increase.png'),
                      )),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '+5h30p',
                        style: TextStyle(
                          fontSize: 25,
                          color: succeedColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        '10%',
                        style: TextStyle(
                          fontSize: 25,
                          color: succeedColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Tăng so với tuần trước',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
