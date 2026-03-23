import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  // 로그인 상태를 관리하는 변수
  bool isLoggedIn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 다른 페이지들과 통일감을 주는 밝은 회색 배경
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
      // isLoggedIn 변수에 따라 보여주는 화면을 전환합니다.
      body: isLoggedIn ? _buildLoggedInView() : _buildLoggedOutView(),
    );
  }

  // 1. 로그인 전 뷰 (로그인 페이지)
  Widget _buildLoggedOutView() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            '반려동물의 건강 관리를 위해\n로그인을 해주세요.',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 40),
          // 아이디 입력칸
          TextField(
            decoration: InputDecoration(
              hintText: '아이디 (이메일)',
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
            ),
          ),
          const SizedBox(height: 16),
          // 비밀번호 입력칸
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: '비밀번호',
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
            ),
          ),
          const SizedBox(height: 32),
          // 로그인 버튼
          ElevatedButton(
            onPressed: () {
              setState(() {
                isLoggedIn = true; // 로그인 상태로 전환
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF3B82F6), // 메인 블루 컬러
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 0,
            ),
            child: const Text(
              '로그인',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 2. 로그인 후 뷰 (회원 정보 및 반려동물 관리)
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

        // 나의 반려동물 섹션 (카드 형식)
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
                  backgroundColor: Colors.orange.shade50,
                  child: const Text('🐱', style: TextStyle(fontSize: 20)),
                ),
                title: const Text(
                  '치즈',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text('고양이 · 코리안 숏헤어 · 3살'),
                trailing: IconButton(
                  icon: const Icon(Icons.edit, size: 20, color: Colors.grey),
                  onPressed: () {}, // 반려동물 정보 수정 로직
                ),
              ),
              const Divider(height: 1, color: Color(0xFFF3F4F6)),
              ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Color(0xFF3B82F6),
                    size: 20,
                  ),
                ),
                title: const Text(
                  '반려동물 추가하기',
                  style: TextStyle(
                    color: Color(0xFF3B82F6),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onTap: () {}, // 반려동물 추가 페이지 이동
              ),
            ],
          ),
        ),
        const SizedBox(height: 36),

        // 내 정보 섹션 (카드 형식)
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
                leading: const Icon(
                  Icons.person_outline,
                  color: Colors.black87,
                ),
                title: const Text('프로필 수정'),
                trailing: const Icon(Icons.chevron_right, color: Colors.grey),
                onTap: () {},
              ),
              const Divider(height: 1, color: Color(0xFFF3F4F6)),
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.black87),
                title: const Text('로그아웃'),
                trailing: const Icon(Icons.chevron_right, color: Colors.grey),
                onTap: () {
                  setState(() {
                    isLoggedIn = false; // 로그아웃 시 다시 로그인 화면으로
                  });
                },
              ),
              const Divider(height: 1, color: Color(0xFFF3F4F6)),
              ListTile(
                leading: const Icon(
                  Icons.person_remove_outlined,
                  color: Colors.redAccent,
                ),
                title: const Text(
                  '회원탈퇴',
                  style: TextStyle(color: Colors.redAccent),
                ),
                trailing: const Icon(Icons.chevron_right, color: Colors.grey),
                onTap: () {},
              ),
            ],
          ),
        ),
        const SizedBox(height: 20), // 하단 여백
      ],
    );
  }
}
