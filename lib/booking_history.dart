import 'package:flutter/material.dart';

// ─────────────────────────────────────────
// 📦 데이터 모델
// 예약 1건의 정보를 담는 클래스입니다.
// ─────────────────────────────────────────
class Reservation {
  final String hospitalName; // 병원 이름
  final String petName; // 반려동물 이름
  final String visitType; // 방문 목적 (예: 정기검진, 피부질환)
  final DateTime dateTime; // 예약 날짜 및 시간
  final String imagePath; // 병원 아이콘 이미지 경로 (assets 사용 시)

  Reservation({
    required this.hospitalName,
    required this.petName,
    required this.visitType,
    required this.dateTime,
    required this.imagePath,
  });

  // D-Day를 계산하는 getter입니다.
  // 오늘 날짜와 예약 날짜의 차이를 일(day) 단위로 반환합니다.
  int get dDay {
    final today = DateTime.now();
    // 시간(hour, minute)은 제외하고 날짜만 비교합니다.
    final todayDate = DateTime(today.year, today.month, today.day);
    final reservationDate = DateTime(
      dateTime.year,
      dateTime.month,
      dateTime.day,
    );
    return reservationDate.difference(todayDate).inDays;
  }

  // 예약이 미래(예정)인지 과거(지난)인지 판단합니다.
  bool get isUpcoming => dDay >= 0;
}

// ─────────────────────────────────────────
// 🏠 예약내역 페이지 메인 위젯
// MainScreen의 Scaffold 안에서 사용되므로
// 여기서는 Scaffold 없이 Column으로 구성합니다.
// ─────────────────────────────────────────
class BookingHistory extends StatefulWidget {
  const BookingHistory({super.key});

  @override
  State<BookingHistory> createState() => _BookingHistoryState();
}

class _BookingHistoryState extends State<BookingHistory>
    with SingleTickerProviderStateMixin {
  // TabController: "예정된 예약" / "지난 예약" 탭을 관리합니다.
  // vsync: this → 애니메이션이 화면 주사율에 맞춰 동작하도록 합니다.
  late TabController _tabController;

  // ── 샘플 예약 데이터 ──
  // 실제 앱에서는 API나 로컬 DB에서 불러옵니다.
  final List<Reservation> _reservations = [
    Reservation(
      hospitalName: '행복 동물병원',
      petName: '뭉치',
      visitType: '정기검진',
      dateTime: DateTime.now().add(const Duration(days: 0)), // 오늘 (D-0)
      imagePath: '',
    ),
    Reservation(
      hospitalName: '사랑 동물의원',
      petName: '나비',
      visitType: '재입원',
      dateTime: DateTime.now().add(const Duration(days: 7)), // 7일 후
      imagePath: '',
    ),
    Reservation(
      hospitalName: '행복 동물병원',
      petName: '뭉치',
      visitType: '정기검진',
      dateTime: DateTime.now().subtract(const Duration(days: 13)), // 13일 전
      imagePath: '',
    ),
    Reservation(
      hospitalName: '그린 24시 동물병원',
      petName: '초코',
      visitType: '응급',
      dateTime: DateTime.now().subtract(const Duration(days: 30)), // 30일 전
      imagePath: '',
    ),
  ];

  @override
  void initState() {
    super.initState();
    // 탭이 2개이므로 length: 2
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    // 페이지가 사라질 때 TabController 메모리를 해제합니다.
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 예정된 예약 목록 (dDay >= 0)
    final upcomingList = _reservations.where((r) => r.isUpcoming).toList()
      ..sort((a, b) => a.dateTime.compareTo(b.dateTime));

    // 지난 예약 목록 (dDay < 0)
    final pastList = _reservations.where((r) => !r.isUpcoming).toList()
      ..sort((a, b) => b.dateTime.compareTo(a.dateTime)); // 최신순

    // ✅ Scaffold 대신 Column을 사용합니다.
    // MainScreen에 이미 Scaffold가 있기 때문에 여기서 또 쓰면 충돌납니다.
    return Column(
      children: [
        // ── 탭 바 (예정된 예약 / 지난 예약) ──
        Container(
          height: 60,
          color: Colors.white,
          child: TabBar(
            controller: _tabController,
            labelColor: const Color(0xFF3366FF), // 선택된 탭 글자 색
            unselectedLabelColor: Colors.grey, // 선택 안 된 탭 글자 색
            indicatorColor: const Color(0xFF3366FF), // 탭 아래 파란 밑줄
            indicatorWeight: 8,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            tabs: const [
              Tab(text: "예정된 예약"),
              Tab(text: '지난 예약'),
            ],
          ),
        ),

        // ── 탭별 콘텐츠 ──
        // Expanded: Column 안에서 TabBarView가 남은 화면을 꽉 채우도록 합니다.
        // 이게 없으면 TabBarView의 높이가 0이 돼서 빈 화면처럼 보입니다.
        Expanded(
          child: ColoredBox(
            color: const Color(0xFFF2F4F8),
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildReservationList(upcomingList, isUpcoming: true),
                _buildReservationList(pastList, isUpcoming: false),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // ─────────────────────────────────────────
  // 📋 예약 목록 빌더
  // isUpcoming이 true면 "예정된 예약", false면 "지난 예약" 스타일로 렌더링
  // ─────────────────────────────────────────
  Widget _buildReservationList(
    List<Reservation> list, {
    required bool isUpcoming,
  }) {
    if (list.isEmpty) {
      return const Center(
        child: Text(
          '예약 내역이 없습니다.',
          style: TextStyle(color: Colors.grey, fontSize: 22),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      itemCount: list.length,
      itemBuilder: (context, index) {
        return _ReservationCard(
          reservation: list[index],
          isUpcoming: isUpcoming,
          onDetail: () => _onDetailTap(list[index]),
          onRebook: () => _onRebookTap(list[index]),
        );
      },
    );
  }

  // 상세보기 버튼 눌렸을 때
  void _onDetailTap(Reservation r) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('${r.hospitalName} 상세보기')));
  }

  // 재예약 버튼 눌렸을 때
  void _onRebookTap(Reservation r) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('${r.hospitalName} 재예약')));
  }
}

// ─────────────────────────────────────────
// 🃏 예약 카드 위젯
// 하나의 예약을 카드 형태로 보여줍니다.
// ─────────────────────────────────────────
class _ReservationCard extends StatelessWidget {
  final Reservation reservation;
  final bool isUpcoming; // true: 예정된 예약 / false: 지난 예약
  final VoidCallback onDetail; // 상세보기 콜백
  final VoidCallback onRebook; // 재예약 콜백

  const _ReservationCard({
    required this.reservation,
    required this.isUpcoming,
    required this.onDetail,
    required this.onRebook,
  });

  @override
  Widget build(BuildContext context) {
    final r = reservation;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        // 예정된 예약은 파란 테두리, 지난 예약은 테두리 없음
        border: isUpcoming
            ? Border.all(
                color: const Color(0xFF3366FF).withOpacity(0.3),
                width: 1.5,
              )
            : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── 상단 행: 병원 아이콘 + 이름 + D-Day 뱃지 ──
            Row(
              children: [
                // 병원 아이콘 (파란 네모 + 십자)
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: const Color(0xFF3366FF),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.local_hospital,
                    color: Colors.white,
                    size: 26,
                  ),
                ),
                const SizedBox(width: 12),

                // 병원 이름 + 반려동물 · 방문유형
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        r.hospitalName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '${r.petName} · ${r.visitType}',
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),

                // D-Day 뱃지 (예정된 예약에만 표시)
                if (isUpcoming) _DDayBadge(dDay: r.dDay),
              ],
            ),

            const SizedBox(height: 14),
            const Divider(height: 1, color: Color(0xFFEEEEEE)),
            const SizedBox(height: 12),

            // ── 하단 행: 날짜/시간 + 버튼 ──
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // 예약 날짜 및 시간
                Row(
                  children: [
                    Icon(
                      Icons.calendar_today,
                      size: 14,
                      color: isUpcoming ? const Color(0xFF3366FF) : Colors.grey,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      _formatDateTime(r.dateTime),
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: isUpcoming
                            ? const Color(0xFF3366FF)
                            : Colors.grey,
                      ),
                    ),
                  ],
                ),

                // 버튼 영역
                Row(
                  children: [
                    // 지난 예약에만 재예약 버튼 표시
                    if (!isUpcoming)
                      _ActionButton(
                        label: '재예약',
                        isPrimary: true,
                        onTap: onRebook,
                      ),
                    if (!isUpcoming) const SizedBox(width: 8),

                    // 상세보기 버튼 (항상 표시)
                    _ActionButton(
                      label: '상세보기',
                      isPrimary: isUpcoming, // 예정된 예약에서는 파란 버튼
                      onTap: onDetail,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // 날짜를 "2026.03.23  10:30" 형태로 변환합니다.
  String _formatDateTime(DateTime dt) {
    final date =
        '${dt.year}.${dt.month.toString().padLeft(2, '0')}.${dt.day.toString().padLeft(2, '0')}';
    final time =
        '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';
    return '$date  $time';
  }
}

// ─────────────────────────────────────────
// 🏷️ D-Day 뱃지 위젯
// ─────────────────────────────────────────
class _DDayBadge extends StatelessWidget {
  final int dDay;

  const _DDayBadge({required this.dDay});

  @override
  Widget build(BuildContext context) {
    // D-Day가 가까울수록 색 강조
    final Color bgColor;
    final Color textColor;
    if (dDay == 0) {
      bgColor = const Color(0xFFFF5252).withOpacity(0.12);
      textColor = const Color(0xFFFF5252);
    } else if (dDay <= 3) {
      bgColor = const Color(0xFFFF9800).withOpacity(0.12);
      textColor = const Color(0xFFFF9800);
    } else {
      bgColor = const Color(0xFF3366FF).withOpacity(0.10);
      textColor = const Color(0xFF3366FF);
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(
            dDay == 0 ? '' : 'D-',
            style: TextStyle(
              fontSize: 11,
              color: textColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            dDay == 0 ? 'D-Day' : '$dDay',
            style: TextStyle(
              fontSize: dDay == 0 ? 13 : 20,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────
// 🔘 액션 버튼 위젯 (상세보기 / 재예약)
// ─────────────────────────────────────────
class _ActionButton extends StatelessWidget {
  final String label;
  final bool isPrimary; // true: 파란 배경, false: 흰 배경 + 파란 테두리
  final VoidCallback onTap;

  const _ActionButton({
    required this.label,
    required this.isPrimary,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: isPrimary ? const Color(0xFF3366FF) : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xFF3366FF), width: 1.5),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: isPrimary ? Colors.white : const Color(0xFF3366FF),
          ),
        ),
      ),
    );
  }
}
