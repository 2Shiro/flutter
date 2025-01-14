void main() {
  // 소화 방식 1 async / await 사용 방법
  // 소화 방식 2 then

  // 비동기 방식으로 콜백으로 이벤트 핸들러 처리를 한다
  addNumber2(10, 5).then(
    (value) => print(
      '결과값 : ${value}',
    ),
  );
  print('main() 함수 종료');
}

Future<int> addNumber2(int n1, int n2) {
  return Future.delayed(
    Duration(
      seconds: 2,
    ),
    () => n1 + n2,
  );
}
