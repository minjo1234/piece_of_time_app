import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  File? _selectedImage;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Colors.blueAccent;

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back),
        ),
        title: const Text('조민', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // TabBar (Profile / Following / Followers)
          TabBar(
            controller: _tabController,
            labelColor: primaryColor,
            unselectedLabelColor: Colors.black,
            indicatorColor: primaryColor,
            tabs: const [
              Tab(text: 'Profile'),
              Tab(text: 'Following'),
              Tab(text: 'Followers'),
            ],
          ),
          const SizedBox(height: 10),

          // TabBarView (content)
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildProfileTab(_selectedImage),
                _buildFollowingTab(),
                _buildFollowersTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileTab(File? selectedImage) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 30),
          InkWell(
            onTap: () {
              _profileBottomSheet(context);
            },
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.grey,
                  backgroundImage:
                      selectedImage != null ? FileImage(selectedImage) : null,
                ),
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Icon(Icons.edit, size: 16, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: const [
              Icon(Icons.chat_bubble_outline, color: Colors.yellow),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  'whals777530@naver.com',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '프로필 설정',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  initialValue: '조민',
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    isDense: true,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              const Text('#2208', style: TextStyle(color: Colors.grey)),
            ],
          ),
          const SizedBox(height: 10),
          TextFormField(
            decoration: const InputDecoration(
              hintText: '소개를 입력하세요',
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.edit),
              isDense: true,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE4E9FF),
              ),
              child: const Text(
                '저장',
                style: TextStyle(color: Colors.blueAccent),
              ),
            ),
          ),
          const SizedBox(height: 30),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '비공개 카테고리',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          ...['일상', '교회', '운동', '중요'].map((text) {
            return SwitchListTile(
              value: false,
              onChanged: (_) {},
              title: Text(text),
            );
          }).toList(),
        ],
      ),
    );
  }

  Widget _buildFollowingTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          InkWell(
            child: Column(
              spacing: 15,
              children: [
                ...['정아라미', '정아라미', '정아라미'].map((text) {
                  return Row(
                    spacing: 15,
                    children: [
                      CircleAvatar(radius: 25),
                      Text(
                        '정아라미',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFollowersTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          InkWell(
            child: Column(
              spacing: 15,
              children: [
                ...['정아라미', '정아라미', '정아라미'].map((text) {
                  return Row(
                    spacing: 15,
                    children: [
                      CircleAvatar(radius: 25),
                      Text(
                        '정아라미',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _profileBottomSheet(BuildContext context) {
    final ImagePicker _picker = ImagePicker();

    showCupertinoModalPopup(
      context: context,
      builder:
          (BuildContext context) => CupertinoActionSheet(
            actions: [
              CupertinoActionSheetAction(
                onPressed: () async {
                  Navigator.pop(context);
                  final XFile? image = await _picker.pickImage(
                    source: ImageSource.gallery,
                  );
                  if (image != null) {
                    setState(() {
                      _selectedImage = File(image.path);
                    });
                  }
                  // Handle 수정
                },
                child: const Text('수정', style: TextStyle(color: Colors.blue)),
              ),
              CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.pop(context);
                  setState(() {
                    _selectedImage = null;
                  });
                },
                isDestructiveAction: true,
                child: const Text('삭제'),
              ),
            ],
            cancelButton: CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('취소', style: TextStyle(color: Colors.blue)),
            ),
          ),
    );
  }
}
