// 1. 창고 안에 들어갈 데이터
import 'package:flutter_riverpod/flutter_riverpod.dart';

String myBook = '흐르는 강물처럼';

// 2. 창고 만들기
class MyBookStore extends StateNotifier<String> {
  // 부모 클래스 state 변수에 등록
  MyBookStore(super.state);

  // 창고 안에 상품을 변경시킬 수 있는 머신
  void changData(String book) {
    state = book;
  }
}

// 3. 창고 관리자 만들기
final myBookStoreProvider = StateNotifierProvider<MyBookStore, String>(
  (ref) => MyBookStore(myBook),
);
