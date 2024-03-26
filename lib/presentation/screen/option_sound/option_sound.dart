import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sleeping_app/common/constant/constant_varaiable.dart';

class SoundScreen extends StatefulWidget {
  const SoundScreen({super.key});

  @override
  State<SoundScreen> createState() => _SoundScreenState();
}

class _SoundScreenState extends State<SoundScreen> {
  List<String> paths = [
    'assets/bonfire.png',
    'assets/heavy-rain.png',
    'assets/snowy.png',
    'assets/white-noise.png',
    'assets/wind.png',
  ];
  List<String> pathsMusic = [
    'mucsic/fire.mp3',
    'mucsic/rain.mp3',
    'mucsic/snow.mp3',
    'mucsic/noise.mp3',
    'mucsic/wind.mp3',
  ];
  List<String> contents = ['fire camp', 'rain', 'snow', 'noise', 'wind'];
  late List<bool> optionList = [];
  Future<void> optionSound(String path) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? user = prefs.getString('userId');
    try {
      await firestore.collection('option').doc(user).set({
        'userId': user,
        'musicPath': path,
      });
    } catch (e) {
      print('Error');
    }
  }

  @override
  void initState() {
    optionList = List.generate(contents.length, (index) => false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Âm Thanh',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: const Color(0xFF401A5D), // Đặt màu cho background
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              const SizedBox(height: 16.0),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Lựa chọn âm thanh',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ),
              const SizedBox(height: 16.0),
              const SizedBox(height: 8.0),
              SizedBox(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height * 0.3,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 150, crossAxisSpacing: 20, mainAxisSpacing: 20),
                  itemBuilder: (BuildContext builder, index) {
                    return buttonSound(paths[index], contents[index], optionList[index]);
                  },
                  itemCount: paths.length,
                ),
              ),
              const SizedBox(height: 8.0),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    for (int i = 0; i < optionList.length; i++) {
                      if (optionList[i]) {
                        optionSound(pathsMusic[i]);
                      }
                    }
                  },
                  child: const Text(
                    'Xong',
                  ),
                ),
              ),
            ]),
          ),
        ));
  }

  Widget buttonSound(String pathImge, String content, bool check) {
    return Container(
      padding: EdgeInsets.all(5),
      width: MediaQuery.sizeOf(context).width * 0.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: check ? purpleButton2 : const Color(0xff8c54fd),
      ),
      child: GestureDetector(
        onTap: () {
          print('vao dau');
          // optionSound(pathImge);
          List<bool> data = [];
          for (int i = 0; i < optionList.length; i++) {
            if (contents[i].contains(content)) {
              data.add(true);
            } else {
              data.add(false);
            }
          }
          setState(() {
            optionList = data;
          });
        },
        child: Column(
          children: [
            Text(
              content,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
              width: 50,
              child: Image(image: AssetImage(pathImge)),
            )
          ],
        ),
      ),
    );
  }
}
