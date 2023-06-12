import 'package:flutter/material.dart';
import 'package:qrcode_scanner_app/qrcode_scan.dart';

void main() => runApp(MainApp());

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QrcodeScanPage(),
    );
  }
}
