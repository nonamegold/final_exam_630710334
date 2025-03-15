import 'package:flutter/material.dart';
import 'answer1.dart';
import 'answer2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ข้อสอบไฟนอลMobile")),
      body:  Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => UserProfileScreen())),
            child: Text("โปรไฟล์ผู้ใช้งาน"),
          ),
          ElevatedButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ShippingCalculatorScreen())),
            child: Text("คำนวณค่าจัดส่ง"),
          ),
        ],
      ),
      ),
    );
  }
}
