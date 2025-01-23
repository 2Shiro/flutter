// InheritedWidget 내장 데이터 타입을 상속받아 구현

import 'package:flutter/cupertino.dart';
import 'package:flutter_statement_v01/common.utils/logger.dart';

class InheritedParent extends InheritedWidget {
  // 공유 상태 데이터 관리에 목적
  // List<String> mySelectedBooks = [];
  List<String> state; // 공유 상태의 데이터를 추상화 높게 설계

  // 부모에게 콜백 메서드를 관리하는 목적
  void Function(String book) onPressed; // 이벤트 핸들러

  // How
  // WHY -> props drilling
  InheritedParent(
      {required this.state, required this.onPressed, required super.child});

  // 상태가 변경되었는지 여부를 판단하는 메서드
  // 주의점 : InheritedWidget을 상속받아 재정의한 InheritedParent을 넣어주자
  @override
  bool updateShouldNotify(covariant InheritedParent oldWidget) {
    logger.d('InheritedParent - updateShouldNotify() 호출 확인');
    logger.d('state : ${state.toString()}');
    logger.d('oldWidget.state : ${oldWidget.state.toString()}');

    // 상태가 달라졌음을 판단하는 방법
    // 현재의 state와 oldWidget의 state를 비교
    if (state.length != oldWidget.state.length) {
      logger.d('상태 변경됨');
      return true;
    }

    for (int i = 0; i < state.length; i++) {
      if (state[i] != oldWidget.state[i]) {
        logger.d('상태 변경됨2');
        return true;
      }
    }
    logger.d('상태 변경 안됨');
    return false; // 상태 변경이 있으면 true, 없으면 false -> bool 여부에 따라 자식 위젯의 build 재호출 결정
  }
}
