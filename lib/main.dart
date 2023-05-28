import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Portfolio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Arial',
      ),
      home: const PortfolioPage(),
    );
  }
}

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Portfolio by Flutter (연습중)',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'About Me',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const CircleAvatar(
              radius: 80,
              backgroundImage:
                  AssetImage('assets/profile_image.jpeg'), // 프로필 이미지 추가
            ),
            const SizedBox(height: 16),
            const Text(
              '안녕하세요 2년차 백엔드 개발자 홍인영 입니다.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Skills',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: const [
                Chip(
                  label: Text('Flutter'),
                  backgroundColor: Colors.blue,
                  labelStyle: TextStyle(color: Colors.white),
                ),
                SizedBox(width: 8),
                Chip(
                  label: Text('Dart'),
                  backgroundColor: Colors.blue,
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              'Projects',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Card(
              child: ExpansionTile(
                leading: Icon(Icons.work),
                title: Text('체인라이트닝 컴퍼니'),
                subtitle: Text('백엔드 개발자'),
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text('체인라이트닝 컴퍼니 프로젝트에 대한 상세 설명입니다.'),
                  ),
                ],
              ),
            ),
            const Card(
              child: ExpansionTile(
                leading: Icon(Icons.work),
                title: Text('똑똑한 개발자'),
                subtitle: Text('패밀리노트/더존비즈온/인플랩/한국수산연구원'),
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text('똑똑한 개발자 프로젝트에 대한 상세 설명입니다.'),
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
