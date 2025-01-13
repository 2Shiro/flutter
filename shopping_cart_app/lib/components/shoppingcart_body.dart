import 'package:flutter/material.dart';

class ShoppingcartBody extends StatelessWidget {
  const ShoppingcartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
          ),
          child: Column(
            children: [
              _buildBodyNameAndPrice(),
              _buildBodyRatingAndReviewCount(),
              _buildBodyColorOptions(),
              _buildBodyButton(),
            ],
          ),
        ),
      ),
    );
  }

  // 1. 이름과 가격
  Widget _buildBodyNameAndPrice() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Urban Soft',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            '\$699',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  // 2. 별점 리뷰 카운트
  Widget _buildBodyRatingAndReviewCount() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 16.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('⭐⭐⭐⭐⭐'),
          Text('review(26)'),
        ],
      ),
    );
  }

  // 3. 색상 옵션 선택
  Widget _buildBodyColorOptions() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: _buildColorOption(),
    );
  }

  // 4. 색상 옵션 위젯을 만드는 함수
  Widget _buildColorOption() {
    return Padding(
      padding: EdgeInsets.only(right: 10),
      child: Stack(
        children: [
          Container(
            width: 700,
            height: 20,
          ),
          Positioned(
            child: Container(
              width: 40, // 외부 원의 크기
              height: 40, // 외부 원의 크기
              decoration: BoxDecoration(
                color: Colors.transparent, // 배경색은 투명
                shape: BoxShape.circle, // 원 모양으로 설정
                border: Border.all(
                  color: Colors.black, // 외부 테두리 색상
                  width: 1, // 외부 테두리 두께
                ),
              ),
              child: Center(
                child: Container(
                  width: 30, // 내부 원의 크기
                  height: 30, // 내부 원의 크기
                  decoration: BoxDecoration(
                    color: Colors.black, // 내부 색상
                    shape: BoxShape.circle, // 원 모양으로 설정
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 50,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
              ),
              child: Center(
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 100,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
              ),
              child: Center(
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 150,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
              ),
              child: Center(
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 200,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
              ),
              child: Center(
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 5. 버튼 만들기
  Widget _buildBodyButton() {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: 300,
        height: 50,
        decoration: BoxDecoration(
            color: Colors.deepOrangeAccent,
            borderRadius: BorderRadius.circular(20.0)),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            'Add in Cart',
            style: TextStyle(
              color: Colors.white, // 글씨 색상을 하얀색으로 설정
              fontSize: 18, // 글씨 크기 설정
            ),
          ),
        ),
      ),
    );
  }
}
