import 'package:flutter/material.dart';

class Service extends StatelessWidget {
  const Service({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xfffff0f9),
              ),
              child: Icon(
                Icons.content_cut,
                color: Color(0xffdb2777),
                size: 35,
              ),
            ),
            Text(
              "미용",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Column(
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xfff0fdf4),
              ),
              child: Icon(Icons.hotel, color: Color(0xff16a34a), size: 35),
            ),
            Text(
              "호텔",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Column(
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xfffff7ed),
              ),
              child: Icon(Icons.child_care, color: Color(0xffea580c), size: 35),
            ),
            Text(
              "동물카페",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Column(
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xfffffbeb),
              ),
              child: Icon(Icons.storefront, color: Color(0xffd97706), size: 35),
            ),
            Text(
              "용품샵",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}
