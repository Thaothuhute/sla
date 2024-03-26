import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sleeping_app/common/constant/constant_varaiable.dart';
import 'package:sleeping_app/presentation/screen/breath_screen/breathing_screen.dart';

class BreathScreen extends StatefulWidget {
  const BreathScreen({super.key});

  @override
  State<BreathScreen> createState() => _BreathScreenState();
}

class _BreathScreenState extends State<BreathScreen> {
  late Map<int, bool> listButtonPress;

  @override
  void initState() {
    listButtonPress = {
      1: true,
      2: false,
      3: false,
      4: false,
    };
    // TODO: implement iniState
    super.initState();
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
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Thời gian',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  listButtonPress.forEach((key, value) {
                                    listButtonPress[key] = false;
                                  });
                                  listButtonPress[1] = true;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: listButtonPress[1] == true
                                      ? purpleButton1
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  '3 Phút',
                                  style: TextStyle(
                                    color: listButtonPress[1] == true ? Colors.white : Colors.grey,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  listButtonPress.forEach((key, value) {
                                    listButtonPress[key] = false;
                                  });
                                  listButtonPress[2] = true;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: listButtonPress[2] == true
                                      ? purpleButton1
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  '4 Phút',
                                  style: TextStyle(
                                    color: listButtonPress[2] == true ? Colors.white : Colors.grey,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  listButtonPress.forEach((key, value) {
                                    listButtonPress[key] = false;
                                  });
                                  listButtonPress[3] = true;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: listButtonPress[3] == true
                                      ? purpleButton1
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  '5 Phút',
                                  style: TextStyle(
                                    color: listButtonPress[3] == true ? Colors.white : Colors.grey,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  listButtonPress.forEach((key, value) {
                                    listButtonPress[key] = false;
                                  });
                                  listButtonPress[4] = true;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: listButtonPress[4] == true
                                      ? purpleButton1
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  '10 Phút',
                                  style: TextStyle(
                                    color: listButtonPress[4] == true ? Colors.white : Colors.grey,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Column(
                          children: [
                            cardContent(
                                'assets/deepbreath.jpg', "Thở sâu", "Thở sâu giúp điều hòa cơ thể",'4-7-8',4,7),
                            const SizedBox(
                              height: 10,
                            ),
                            cardContent('assets/boxbreath.jpg', "Thở hộp",
                                "Thở sâu giúp điều hòa cơ thể, mang lại cảm giác yên bình",'4-4-4-4',4,4),
                            const SizedBox(
                              height: 10,
                            ),
                            cardContent('assets/noisesleep.jpg', "Giảm ngáy",
                                "Thở sâu giúp điều hòa cơ thể, mang lại cảm giác yên bình",'5-6',5,6),
                          ],
                        )
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

  Widget cardContent(String pathImage, String title, String content,String beat,int breathIn,int breathOut) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>  BreathingScreen(breathIn: breathIn,breathOut: breathOut, step: 6,)));
      },
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.9,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: purpleButton1,
            boxShadow: const [
              BoxShadow(
                blurRadius: 10,
                color: Colors.black,
              )
            ]),
        child: Row(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height * 0.12,
              width: MediaQuery.sizeOf(context).width * 0.25,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
                  image: DecorationImage(
                    image: AssetImage(pathImage),
                    fit: BoxFit.cover,
                  )),
            ),
            const SizedBox(
              width: 6,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              height: MediaQuery.sizeOf(context).height * 0.12,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    beat,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.5,
                    child: Text(
                      content,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
