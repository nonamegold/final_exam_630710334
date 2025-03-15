import 'package:flutter/material.dart';

class ShippingCalculatorScreen extends StatefulWidget {
  @override
  _ShippingCalculatorScreenState createState() => _ShippingCalculatorScreenState();
}

class _ShippingCalculatorScreenState extends State<ShippingCalculatorScreen> {
  final TextEditingController weightController = TextEditingController();
  String selectedDistance = "ในเมือง";
  String selectedSpeed = "ปกติ";
  bool specialPacking = false;
  bool insurance = false;
  String result = "";

  void calculateShipping() {
    double weight = double.tryParse(weightController.text) ?? 0;
    if (weight <= 0) {
      setState(() {
        result = "กรุณากรอกน้ำหนักสินค้า";
      });
      return;
    }

    double baseRate = selectedDistance == "ในเมือง"
        ? 10
        : selectedDistance == "ต่างจังหวัด"
            ? 15
            : 50;
    double baseCost = weight * baseRate;

    double extraCost = 0;
    if (specialPacking) extraCost += 20;
    if (insurance) extraCost += 50;

    double speedCost = selectedSpeed == "ด่วน" ? 30 : (selectedSpeed == "ด่วนพิเศษ" ? 50 : 0);

    double totalCost = baseCost + extraCost + speedCost;

    setState(() {
      result = "ค่าจัดส่งทั้งหมด: ฿ ${totalCost.toStringAsFixed(2)}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("คำนวณค่าจัดส่ง")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "น้ำหนักสินค้า(กก):"),
            ),
            Text(
              'เลือกระยะทาง:',
              style: const TextStyle(fontSize: 15),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 10),
            DropdownButton<String>(
              value: selectedDistance,
              items: ["ในเมือง", "ต่างจังหวัด", "ต่างประเทศ"].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  selectedDistance = newValue!;
                });
              },
            ),
            Text(
              "บริการเสริม:",
              style: const TextStyle(fontSize: 15),
            ),
            CheckboxListTile(
              title: Text("แพ็คกิ้งพิเศษ (+20 บาท)"),
              value: specialPacking,
              onChanged: (bool? value) {
                setState(() {
                  specialPacking = value!;
                });
              },
            ),
            CheckboxListTile(
              title: Text("ประกันพัสดุ (+50 บาท)"),
              value: insurance,
              onChanged: (bool? value) {
                setState(() {
                  insurance = value!;
                });
              },
            ),
            Text(
              "เลือกความเร่งด่วน:",
              style: const TextStyle(fontSize: 15),
            ),
            SizedBox(height: 10),
            Column(
              children: [
                RadioListTile(
                  title: Text("ปกติ"),
                  value: "ปกติ",
                  groupValue: selectedSpeed,
                  onChanged: (value) {
                    setState(() {
                      selectedSpeed = value!;
                    });
                  },
                ),
                RadioListTile(
                  title: Text("ด่วน"),
                  value: "ด่วน",
                  groupValue: selectedSpeed,
                  onChanged: (value) {
                    setState(() {
                      selectedSpeed = value!;
                    });
                  },
                ),
                RadioListTile(
                  title: Text("ด่วนพิเศษ"),
                  value: "ด่วนพิเศษ",
                  groupValue: selectedSpeed,
                  onChanged: (value) {
                    setState(() {
                      selectedSpeed = value!;
                    });
                  },
                ),
              ],
            ),
            
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: calculateShipping,
              child: Text("คำนวณราคา"),
            ),
            SizedBox(height: 20),
            Text(result, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
