import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {
  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("โปรไฟล์ผู้ใช้")),
      body: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage("https://scontent.fbkk29-4.fna.fbcdn.net/v/t1.15752-9/482881046_513590641509117_7095661358244257637_n.jpg?stp=dst-jpg_s2048x2048_tt6&_nc_cat=110&ccb=1-7&_nc_sid=9f807c&_nc_ohc=ERjBxqC90UAQ7kNvgHXBH5n&_nc_oc=AdikBjpYaYvHtyt4fW6fRrN8kdhXSTxpLOtkDTVuGYoKm9qH2-Ijq1uwW9JFHImUDcY&_nc_zt=23&_nc_ht=scontent.fbkk29-4.fna&oh=03_Q7cD1wHsv7JOFWGZvL3SWi68ZqU7t0AXHAqs8uYLfly7E6UJ-g&oe=67FC6F16"),
          ),
          SizedBox(height: 10),
          Text("เมธาวัจน์ ธนิพัฒน์วรกิจ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text("thaniphatworaki_m@silpakorn.edu", style: TextStyle(fontSize: 16, color: Colors.grey)),
          SizedBox(height: 20),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.blue),
            title: Text("การตั้งค่า"),
          ),
          ListTile(
            leading: Icon(Icons.lock, color: Colors.blue),
            title: Text("เปลี่ยนรหัสผ่าน"),
          ),
          ListTile(
            leading: Icon(Icons.help, color: Colors.blue),
            title: Text("ความเป็นส่วนตัว"),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => showSnackbar(context, "แก้ไขโปรไฟล์"),
            child: Text("แก้ไขโปรไฟล์"),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => showSnackbar(context, "ออกจากระบบ"),
            child: Text("ออกจากระบบ"),
          ),
        ],
      ),
    );
  }
}
