import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final String bookHospitalName;
  final String bookDate;
  final DateTime bookDateTime;

  const BookCard({
    super.key,
    required this.bookHospitalName,
    required this.bookDate,
    required this.bookDateTime,
  });

  String getDday() {
    final today = DateTime.now();
    final todayOnly = DateTime(today.year, today.month, today.day);
    final targetOlny = DateTime(
      bookDateTime.year,
      bookDateTime.month,
      bookDateTime.day,
    );
    final diff = targetOlny.difference(todayOnly).inDays;

    if (diff == 0) return "D-Day";
    if (diff > 0) return "$diff";
    return "${diff.abs()}";
  }

  Color getDdayColor() {
    final today = DateTime.now();
    final todayOnly = DateTime(today.year, today.month, today.day);
    final targetOnly = DateTime(
      bookDateTime.year,
      bookDateTime.month,
      bookDateTime.day,
    );
    final diff = targetOnly.difference(todayOnly).inDays;

    if (diff <= 0) return Color(0xffe24b4a); // 당일 or 지남 → 빨간색
    if (diff <= 3) return Color(0xffea580c); // 3일 이내 → 주황색
    return Color(0xff1d4ed8); // 그 외 → 파란색
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 20),
      child: Container(
        padding: EdgeInsets.all(15),
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          border: Border.all(color: Color(0xff3b82f6), width: 2),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xffeff6ff),
              ),
              child: Icon(Icons.calendar_month, color: Color(0xff1d4ed8)),
            ),
            SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  bookHospitalName,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  bookDate,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Spacer(),
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xffdbeafe)),
                borderRadius: BorderRadius.circular(15),
                color: Color(0xffeff6ff),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "D-DAY",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff3b82f6),
                    ),
                  ),
                  Text(
                    getDday(),
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: getDdayColor(),
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

class EmptyBookCard extends StatelessWidget {
  const EmptyBookCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 20),
      child: Container(
        padding: EdgeInsets.all(15),
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          border: Border.all(color: Color(0xffcbd5e1), width: 2), // 회색 테두리
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.calendar_month, color: Colors.blueGrey, size: 22),
            SizedBox(width: 10),
            Text(
              "예약된 내역이 없습니다",
              style: TextStyle(fontSize: 20, color: Colors.blueGrey),
            ),
          ],
        ),
      ),
    );
  }
}
