import 'package:flutter/material.dart';
import 'profile_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Custom Widget"),
          centerTitle: true,
          backgroundColor: Colors.pink[50],
        ),
        body: const Center(
          child: ProfileCard(
            name: "Meathawat Thaniphatworakij",
            position: "CS",
            email: "thaniphatworaki_m@silpakorn.edu",
            phoneNumber: "097159XXXX",
            imageUrl: "https://scontent.fbkk29-4.fna.fbcdn.net/v/t1.15752-9/482881046_513590641509117_7095661358244257637_n.jpg?stp=dst-jpg_s2048x2048_tt6&_nc_cat=110&ccb=1-7&_nc_sid=9f807c&_nc_ohc=ERjBxqC90UAQ7kNvgHXBH5n&_nc_oc=AdikBjpYaYvHtyt4fW6fRrN8kdhXSTxpLOtkDTVuGYoKm9qH2-Ijq1uwW9JFHImUDcY&_nc_zt=23&_nc_ht=scontent.fbkk29-4.fna&oh=03_Q7cD1wHsv7JOFWGZvL3SWi68ZqU7t0AXHAqs8uYLfly7E6UJ-g&oe=67FC6F16",
          ),
        ),
      ),
    );
  }
}
