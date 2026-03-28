import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  // 로그인 상태 관리
  bool isLoggedIn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const Text(
          '마이 페이지',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
      ),
      // 현재 상태에 따라 다른 화면을 보여줍니다.
      body: isLoggedIn ? _buildLoggedInView() : _buildLoggedOutView(),
    );
  }

  // 1. 로그인 전 뷰 (로그아웃 상태일 때)
  Widget _buildLoggedOutView() {
    return Center(
      child: ElevatedButton(
        onPressed: () => setState(() => isLoggedIn = true),
        child: const Text("로그인 하기"),
      ),
    );
  }

  // 2. 로그인 후 뷰 (반려동물 정보 포함)
  Widget _buildLoggedInView() {
    return ListView(
      padding: const EdgeInsets.all(20.0),
      children: [
        // 상단 프로필 요약
        Row(
          children: [
            CircleAvatar(
              radius: 32,
              backgroundColor: Colors.blue.shade50,
              child: const Icon(
                Icons.person,
                size: 40,
                color: Color(0xFF3B82F6),
              ),
            ),
            const SizedBox(width: 16),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '김보호자님',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  'petlover@example.com',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 36),

        // 나의 반려동물 섹션
        const Text(
          '나의 반려동물',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFE5E7EB), width: 1),
          ),
          child: Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  radius: 24,
                  // [핵심] 최상위 assets 폴더의 이미지를 불러옵니다.
                  backgroundImage: const AssetImage("assets/ho.png"),
                  onBackgroundImageError: (exception, StackTrace) {
                    debugPrint('이미지 로드 에러 : $exception');
                  },
                ),
                title: const Text(
                  '호',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text('코리안 숏헤어(치즈) · 수컷 · 6살'),
                trailing: const Icon(Icons.edit, size: 20, color: Colors.grey),
              ),
              ListTile(
                leading: CircleAvatar(
                  radius: 24,
                  // [핵심] 최상위 assets 폴더의 이미지를 불러옵니다.
                  backgroundImage: const AssetImage("assets/kun1.png"),
                ),
                title: const Text(
                  '쿤',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text('코리안 숏헤어(블랙캣) · 암컷 · 6살'),
                trailing: const Icon(Icons.edit, size: 20, color: Colors.grey),
              ),
              const Divider(height: 1, color: Color(0xFFF3F4F6)),
              ListTile(
                leading: const Icon(Icons.add_circle, color: Color(0xFF3B82F6)),
                title: const Text(
                  '반려동물 추가하기',
                  style: TextStyle(color: Color(0xFF3B82F6)),
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
        const SizedBox(height: 36),

        // 내 정보 관리 섹션
        const Text(
          '내 정보 관리',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFE5E7EB), width: 1),
          ),
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.person_outline),
                title: const Text('프로필 수정'),
                onTap: () {},
              ),
              const Divider(height: 1, color: Color(0xFFF3F4F6)),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('로그아웃'),
                onTap: () => setState(() => isLoggedIn = false),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
