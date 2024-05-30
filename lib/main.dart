import 'package:CattleSavior/db/db_helpers.dart';
import 'package:flutter/material.dart';
import 'package:CattleSavior/home_screen.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.initDb();
  await GetStorage.init();

  // Initialize FFI
  sqfliteFfiInit();
  // Set the database factory
  databaseFactory = databaseFactoryFfi;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CATTLE SAVIOR',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const HomeScreen(),
    );
  }
}
