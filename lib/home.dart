import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:todoc/widget/book_card.dart';
import 'package:todoc/widget/hospital_card.dart';

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
          Icon(Icons.circle_notifications, color: Colors.amber, size: 30),
          SizedBox(width: 10),
          Icon(Icons.person, color: Color(0xff60a5fa), size: 30),
          SizedBox(width: 15),
        ],
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 250,
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
                  gradient: LinearGradient(
                    colors: [Color(0xff1d4ed8), Color(0xff60a5fa)],
                  ),
                ),
                child: Text(
                  "지도에서 병원 찾기",
                  style: TextStyle(
                    fontSize: 22,
                    color: Color(0xfff1f5f9),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            BookCard(
              bookHospitalName: "하이유 동물병원",
              bookDate: "26.03.28 (목) 13:00",
              bookDateTime: DateTime(2026, 3, 28),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                children: [
                  Icon(Icons.access_time, size: 25),
                  SizedBox(width: 5),
                  Text(
                    "이전 예약 내역",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    "전체보기",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff1d4ed8),
                    ),
                  ),
                  Icon(Icons.arrow_right_alt, color: Color(0xff1d4ed8)),
                ],
              ),
            ),

            HospitalCard(hospitalName: "행복 동물병원", date: "2026.03.10"),
          ],
        ),
      ),
    );
  }
}
