import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_statement_v01/riverpod_01/_02/fruit.dart';

import '../../common.utils/logger.dart';

void main() {
  // 1. Riverpod을 사용하기 위해 ProviderScope로 감싸기
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FruitPage(),
    );
  }
}

// 2. Riverpod을 사용하기 위해서 소비자 ConsumerWidget으로 변경
class FruitPage extends ConsumerWidget {
  const FruitPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 사용하는 측 코드에서 ref.read(...) / ref.watch(...)
    // 한 번만 데이터를 가져오려면 ref.read(...)

    // String getFruit = ref.read(FruitProvider);
    String getFruit = ref.watch(fruitProvider); // 상태 변경이 되면 계속 알림을 받음
    logger.d('getFruit 확인 : ${getFruit}');

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('데이터 확인 : ${getFruit}'),
              ElevatedButton(
                  onPressed: () {
                    // 상태 변경 기능은 누가?
                    // 데이터를가져오는게 아니라 창고를 가져와서 머신을 동작시켜야
                    // read() 메서드는 데이터를 한번 들고오면서 창고 자체에 접근 가능
                    FruitStore fruitStore = ref.read(fruitProvider.notifier);
                    fruitStore.changeData('딸기2');
                  },
                  child: Text('딸기로 변경'))
            ],
          ),
        ),
      ),
    );
  }
}

/**
 * 정리
 * Provider - 1회 알바생
 * - 데이터를 단순히 한 번 제공하는 역할, 상태가 변하지 않는 데이터를 관리할 때 사용
 *   즉, 주로 정적인 데이터를 제공할 때 사용 (단순 문자열, 정적 객체 등)
 *
 * StateNotifierProvider - 창고 관리자
 * - 상태 관리(state) 변경할 수 있는 창고 관리자 역할 -> 추상화 시켜서 사용하는거
 *   상태가 변경이 되면 이를 구동중인 모든 위젯에게 알려준다
 *   ref.read() 창고 자체에 접근할 수 있음
 *   ref.watch() 계속 구독하여 상태 변경을 감지함
 */
