import 'package:flutter_riverpod/flutter_riverpod.dart';

// RiverPod ver1.0
// 1. 창고 안에서 관리할 데이터 선정
// 기본 데이터 타입, 클래스 묶음
String fruit = '사과';

// 2. 창고를 만들자 FruitStore
// 창고를 만드는 규격 이름은 StateNotifier
class FruitStore extends StateNotifier<String> {
  // super.state 는 전달 받은 데이터를 상태로 등록시키는 과정
  FruitStore(super.state);

  // 창고 안에는 관리할 상품도 존재할 수 있고, 편하게 관리할 머신도 있다
  // 창고 안에 데이터를 변경할 수 있는 기능을 만들어주자
  void changeData(String data) {
    state = data;
  }
}

// 3. 창고 관리자에게 창고를 등록하고 관리하도록 설정
// StateNotifierProvider<창고, 데이터 타입>
final fruitProvider = StateNotifierProvider<FruitStore, String>(
  (ref) => FruitStore(fruit),
);
