import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:warikan/models/event_keisha.dart';
import 'package:warikan/models/event_normal.dart';
import 'package:warikan/pages/main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // アプリのドキュメントディレクトリを取得
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
    [EventNormalSchema, EventKeishaSchema],
    directory: dir.path,
  );
  runApp(ProviderScope(
      child: MyApp(
    isar: isar,
  )));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isar});

  final Isar isar;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0x00196b52)),
        useMaterial3: true,
        fontFamily: 'Noto Sans JP',
      ),
      home: MainPage(isar: isar),
    );
  }
}
