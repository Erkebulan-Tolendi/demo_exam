import 'package:demo_exam/features/navigation/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

import 'features/data/provider/events/event_provider.dart';
import 'features/data/provider/tickets/close_provider_hive.dart';
import 'features/data/provider/tickets/open_provider_hive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("open1_box");
  await Hive.openBox("close1_box");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => EventProvider()),
          ChangeNotifierProvider(
            create: (_) => OpenProviderHive(Hive.box("open1_box")),
          ),
          ChangeNotifierProvider(
            create: (_) => CloseProviderHive(Hive.box("close1_box")),
          ),
        ],
        child: BottomNavBar(),
      ),
    );
  }
}
