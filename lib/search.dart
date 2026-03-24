import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  // 임시 병원 데이터
  final List<Map<String, String>> hospitals = [
    {
      "name": "행복 동물병원",
      "location": "서울 마포구 합정동",
      "distance": "0.3km",
      "rating": "4.9",
      "tag": "강아지 · 고양이",
    },
    {
      "name": "사랑 동물의원",
      "location": "서울 마포구 망원동",
      "distance": "0.7km",
      "rating": "4.7",
      "tag": "강아지",
    },
    {
      "name": "그린 24시 동물병원",
      "location": "서울 마포구 서교동",
      "distance": "1.2km",
      "rating": "4.8",
      "tag": "고양이 · 응급",
    },
    {
      "name": "미래 동물병원",
      "location": "서울 마포구 연남동",
      "distance": "1.6km",
      "rating": "4.6",
      "tag": "강아지 · 고양이",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // 검색창
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "병원명, 지역...",
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  filled: true, // ← 배경색 활성화
                  fillColor: Color(0xffe2e8f0), // ← 회색 배경
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none, // ← 테두리 제거
                  ),
                ),
              ),
            ),

            // 필터 칩
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  FilterChip(label: Text("전체"), onSelected: (v) {}),
                  SizedBox(width: 8),
                  FilterChip(label: Text("24시간"), onSelected: (v) {}),
                  SizedBox(width: 8),
                  FilterChip(label: Text("응급"), onSelected: (v) {}),
                  SizedBox(width: 8),
                  FilterChip(label: Text("주말 진료"), onSelected: (v) {}),
                  SizedBox(width: 8),
                  FilterChip(label: Text("영업중"), onSelected: (v) {}),
                ],
              ),
            ),

            SizedBox(height: 8),

            // 병원 목록
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 12),
                itemCount: hospitals.length,
                itemBuilder: (context, index) {
                  final hospital = hospitals[index];
                  return Card(
                    margin: EdgeInsets.only(bottom: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: Color(0xffbfdbfe), width: 1),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Color(0xffeff6ff),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              Icons.local_hospital,
                              color: Color(0xff1d4ed8),
                              size: 50,
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  hospital["name"]!,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  hospital["location"]!,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  hospital["tag"]!,
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xff1d4ed8),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "${hospital["rating"]}",
                                style: TextStyle(fontSize: 13),
                              ),
                              Text(
                                hospital["distance"]!,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(height: 6),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xff1d4ed8),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  "예약하기",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
