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
      body: SingleChildScrollView(
        child: Container(
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
                backgroundImage: AssetImage('assets/profile_image.jpeg'),
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
                  _SkillChip(label: 'Flutter'),
                  SizedBox(width: 8),
                  _SkillChip(label: 'Dart'),
                ],
              ),
              const SizedBox(height: 24),
              const Text(
                'Career',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              const _CompanyCard(
                leadingIcon: Icons.work,
                companyName: '체인라이트닝 컴퍼니',
                position: '백엔드 개발자',
                duration: '2020 - 2022',
                projects: [
                  '프로젝트 1',
                  '프로젝트 2',
                  '프로젝트 3',
                ],
              ),
              const SizedBox(height: 16),
              const _CompanyCard(
                leadingIcon: Icons.work,
                companyName: '똑똑한 개발자',
                position: '패밀리노트/더존비즈온/인플랩/한국수산연구원',
                duration: '2018 - 2020',
                projects: [
                  '프로젝트 A',
                  '프로젝트 B',
                  '프로젝트 C',
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SkillChip extends StatelessWidget {
  final String label;

  const _SkillChip({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        label,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.blue,
    );
  }
}

class _CompanyCard extends StatelessWidget {
  final IconData leadingIcon;
  final String companyName;
  final String position;
  final String duration;
  final List<String> projects;

  const _CompanyCard({
    Key? key,
    required this.leadingIcon,
    required this.companyName,
    required this.position,
    required this.duration,
    required this.projects,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        leading: Icon(leadingIcon),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(companyName),
            const SizedBox(height: 4),
            Text(
              duration,
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
        subtitle: Text(position),
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: projects.map((project) {
                return Text('• $project');
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
