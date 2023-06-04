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
          'Hong in yeong',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Check',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Skills'),
              onTap: () {
                Navigator.pop(context);
                // Skills 화면으로 이동
              },
            ),
            ListTile(
              title: const Text('Career'),
              onTap: () {
                Navigator.pop(context);
                // Career 화면으로 이동
              },
            ),
          ],
        ),
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
                  _SkillChip(label: 'Python'),
                  SizedBox(width: 8),
                  _SkillChip(label: 'Django Rest Framework'),
                  SizedBox(width: 8),
                  _SkillChip(label: 'AWS'),
                  SizedBox(width: 8),
                  _SkillChip(label: 'Dart'),
                  SizedBox(width: 8),
                  _SkillChip(label: 'Flutter'),
                  SizedBox(width: 8),
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
                duration: '2023.06 - Now',
                projects: [
                  _ProjectTile(
                    projectName: '프로젝트 1',
                    projectDescription: '프로젝트 1 설명',
                  ),
                  _ProjectTile(
                    projectName: '프로젝트 2',
                    projectDescription: '프로젝트 2 설명',
                  ),
                  _ProjectTile(
                    projectName: '프로젝트 3',
                    projectDescription: '프로젝트 3 설명',
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const _CompanyCard(
                leadingIcon: Icons.work,
                companyName: '똑똑한 개발자',
                position: '백엔드 개발자',
                duration: '2022.02 - 2023.05',
                projects: [
                  _ProjectTile(
                    projectName: '패밀리노트',
                    projectDescription: '패밀리노트 설명',
                  ),
                  _ProjectTile(
                    projectName: '더존비즈온',
                    projectDescription: '더존비즈온 설명',
                  ),
                  _ProjectTile(
                    projectName: '인플랩',
                    projectDescription: '인플랩 설명',
                  ),
                  _ProjectTile(
                    projectName: '한국수산연구원',
                    projectDescription: '한국수산연구원 설명',
                  ),
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
  final List<_ProjectTile> projects;

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
              children: projects,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProjectTile extends StatelessWidget {
  final String projectName;
  final String projectDescription;

  const _ProjectTile({
    Key? key,
    required this.projectName,
    required this.projectDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('• $projectName'),
        Text(projectDescription),
      ],
    );
  }
}
