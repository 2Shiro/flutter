import 'package:flutter_riverpod/flutter_riverpod.dart';

class Product {
  final bool isAvaliable;
  final String name;

  Product({required this.isAvaliable, required this.name});

  // copyWith 메서드 추가
}

// 창고 만들기
class ProductNotifier extends Notifier<List<Product>> {
  @override
  List<Product> build() {
    // 초기값 설정
    return [];
  }

  // addProduct()
  // 재고 여부 변경 toggleAsAvaliable(int index)
  // remoteProduct(int index)
  //
}

// 창고 관리자
final productProvider = NotifierProvider<ProductNotifier, List<Product>>(
  () => ProductNotifier(),
);
