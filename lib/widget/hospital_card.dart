import 'package:flutter/material.dart';

class HospitalCard extends StatelessWidget {
  final String hospitalName;
  final String date;
  final String detail;

  const HospitalCard({
    super.key,
    required this.hospitalName,
    required this.date,
    required this.detail,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Icon(Icons.local_hospital, size: 90),
          Expanded(
            child: Column(
              children: [
                Padding(padding: EdgeInsetsGeometry.all(5)),
                Text(
                  hospitalName,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  detail,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                Text(
                  date,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff94a3b8),
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
