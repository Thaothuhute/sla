import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:sleeping_app/common/constant/constant_varaiable.dart';
import 'package:sleeping_app/presentation/supervise_screen/supervise_date.dart';
import 'package:sleeping_app/presentation/supervise_screen/supervise_screen_wee.dart';
import 'package:sleeping_app/presentation/widget/tabbar.dart';

class SuperviseScreen extends StatefulWidget {
  const SuperviseScreen({super.key});

  @override
  State<SuperviseScreen> createState() => _SuperviseScreenState();
}

class _SuperviseScreenState extends State<SuperviseScreen> {
  late final PageController pageController;
  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.transparent,
      debugShowCheckedModeBanner: false,
      home: SafeArea(
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
            Container(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: TabBarWidget(
                        colorBackground: Colors.transparent,
                        tabViewWidget: const [
                          SuperviseScreenDay(),
                          SuperviseScreenWeek(),
                        ],
                        textTitle: const [
                          'Ngay',
                          'Tuan',
                        ],
                        pageController: pageController,
                        unselectLabelBackground: Colors.deepPurpleAccent,
                        indicatorUnderline: Colors.black,
                        indicatorLabelTextColor: Colors.white,
                        unselectTextColor: Colors.white70,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
