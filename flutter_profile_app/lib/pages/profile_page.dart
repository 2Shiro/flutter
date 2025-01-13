import 'package:flutter/material.dart';
import 'package:flutter_profile_app/components/profile_header.dart';
import 'package:flutter_profile_app/components/profile_count_info.dart';
import 'package:flutter_profile_app/components/profile_button.dart';

// 페이지 단위에 위젯을 만들어보자. --> 클래스로 만들어 보자.
// 우리들에 규칙 2 <--- Scaffold
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('profile'),
        ),
        endDrawer: Container(
          width: 200,
          // double.infinity <-- 가능한 최대로 확장 하라
          //height: double.infinity,
          color: Colors.blue,
        ),
        body: Column(
          children: [
            const SizedBox(height: 20),
            ProfileHeader(),
            const SizedBox(height: 20),
            ProfileCountInfo(),
            const SizedBox(height: 20),
            ProfileButtons(),
            Expanded(child: ProfileTab()),
          ],
        ),
      ),
    );
  }
} // end of ProfilePage

// 상태가 있는 위젯
// StatefulWidget 을 상속 받음
// 2개의 클래스가 한 묶음이다.
class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab>
    with SingleTickerProviderStateMixin {
  // 멤버 변수
  // TabController 는 TabBar 와 TabBarView 를 동기화 하는 컨트롤러
  TabController? _tabController;

  // 단 한번 호출 되는 메서드
  @override
  void initState() {
    super.initState();
    print('프로필 탭 내부 클래스 init 호출');
    // length 는 탭의 개수
    // vsync 는 자연스러운 애니메이션 전환을 위한 TickerProvider 를 활용한다.
    _tabController = TabController(length: 2, vsync: this);
  }

  // build 메서드는 기본적으로 그림을 그릴 때 호출된다.
  @override
  Widget build(BuildContext context) {
    // 지역 변수
    print('2222222222');
    return Column(
      children: [
        _buildTabBar(),
        // Expanded 가진 공간에서 최대로 넓혀주는 것
        Expanded(
          child: _buildTabBarView(),
        )
      ],
    );
  }

  TabBarView _buildTabBarView() {
    return TabBarView(
      controller: _tabController,
      children: [
        GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 0, // 열(컬럼) 사이의 간격을 10으로 설정
            mainAxisSpacing: 0, // 행(로우) 사이의 간격을 10으로 설정
            crossAxisCount: 3,
          ),
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(20.0),
              color: Colors.blueGrey,
              child: Image.network('https://picsum.photos/id/${index}/200/300',
                  fit: BoxFit.cover),
            );
          },
          itemCount: 10,
        ),
        GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 10, // 열(컬럼) 사이의 간격을 10으로 설정
            mainAxisSpacing: 10, // 행(로우) 사이의 간격을 10으로 설정
            crossAxisCount: 3,
          ),
          itemBuilder: (context, index) {
            return Image.network('https://picsum.photos/id/${index}/200/300',
                fit: BoxFit.cover);
          },
          itemCount: 2,
        ),
      ],
    );
  }

  TabBar _buildTabBar() {
    return TabBar(
      // 중간 매개체로 연결
      controller: _tabController,
      // tabs 에는 Tab 만 들어가야함.
      tabs: [
        Tab(
          icon: Icon(Icons.photo_camera),
        ),
        Tab(
          icon: Icon(Icons.share),
        ),
      ],
    );
  }
}
