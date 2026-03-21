import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset("assets/todak_logo.png", height: 30),
            SizedBox(width: 10),
            Text("토닥", style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        actions: [
          Icon(Icons.notifications, color: Color(0xff60a5fa), size: 30),
          SizedBox(width: 10),
          Icon(Icons.person, color: Color(0xff60a5fa), size: 30),
          SizedBox(width: 15),
        ],
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              child: NaverMap(
                options: NaverMapViewOptions(
                  initialCameraPosition: NCameraPosition(
                    target: NLatLng(37.5665, 126.9780),
                    zoom: 14,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xff1d4ed8),
                ),
                child: Text(
                  "지도에서 병원 찾기",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xfff1f5f9),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Row(
                children: [
                  Icon(Icons.access_time, size: 30),
                  SizedBox(width: 5),
                  Text(
                    "이전 예약 내역",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    "전체보기",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff1d4ed8),
                    ),
                  ),
                  Icon(Icons.arrow_right_alt, color: Color(0xff1d4ed8)),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xffdbeafe),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.local_hospital, size: 40),
                  Text(
                    "행복 동물병원",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text("2026.03.10", style: TextStyle(fontSize: 15)),
                  Container(
                    alignment: Alignment.center,
                    height: 30,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xff60a5fa),
                    ),
                    child: Text(
                      "다시 예약하기",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
