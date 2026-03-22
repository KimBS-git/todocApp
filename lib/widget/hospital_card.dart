import 'package:flutter/material.dart';

class HospitalCard extends StatelessWidget {
  final String hospitalName;
  final String date;

  const HospitalCard({
    super.key,
    required this.hospitalName,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Icon(Icons.local_hospital, size: 100),
          Expanded(
            child: Column(
              children: [
                Padding(padding: EdgeInsetsGeometry.all(5)),
                Text(
                  hospitalName,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(date, style: TextStyle(fontSize: 15)),
                SizedBox(height: 5),
                Container(
                  alignment: Alignment.center,
                  height: 30,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xff1d4ed8),
                  ),
                  child: Text(
                    "다시 예약하기",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xfff1f5f9),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
