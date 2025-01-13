import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// 이벤트가 일어나면 다시 화면을 그려야 한다.
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // 현재 시간 상태를 저장하는 변수
  String timeOfDay = '낮';

  @override
  Widget build(BuildContext context) {
    print('전체 build() 메서드 호출');
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Container(
            color: Colors.blue,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      print('이벤트 리스너 등록');
                      timeOfDay = (timeOfDay == '낮' ? '밤' : '낮');
                      print('현재 상태 값 : ${timeOfDay}');
                      // 화면을 새롭게 갱신하라고 명령해야 함.
                      setState(() {
                        print('화면을 다시 그려줘 --> bilid() 재호출한다');
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      color: (timeOfDay == '낮' ? Colors.green : Colors.red),
                      child: Text(
                        timeOfDay,
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
                ),
                // 이미지
                Expanded(
                  flex: 1,
                  child: FlutterLogo(
                    size: 300,
                    style: FlutterLogoStyle.markOnly,
                    textColor: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
