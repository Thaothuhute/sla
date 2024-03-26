import 'package:alarm/alarm.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sleeping_app/presentation/screen/breath_screen/breathing_screen.dart';
import 'package:sleeping_app/presentation/screen/home_screen/home_screen.dart';
import 'package:sleeping_app/presentation/screen/sleeping_screen/sleeping_screen.dart';
import 'package:sleeping_app/presentation/supervise_screen/supervise_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import 'firebase_options.dart';
import 'presentation/screen/breath_screen/bloc/breath_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Alarm.init(showDebugLogs: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  Future<void> checkExist() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? user = prefs.getString('userId');
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    String uuid = const Uuid().v6();
    if (user!.isEmpty) {
      try {
        await firestore.collection('user').doc(uuid).set({
          'userId': uuid,
        });
        await prefs.setString('user', uuid);
      } catch (e) {
        print('Error');
      }
    }
  }

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => BreathBloc())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
