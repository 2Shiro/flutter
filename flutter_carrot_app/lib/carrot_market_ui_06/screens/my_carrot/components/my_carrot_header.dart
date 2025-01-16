import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../theme.dart';

class MyCarrotHeader extends StatelessWidget {
  const MyCarrotHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          children: [
            _buildProfileRow(),
            const SizedBox(height: 30),
            _buildProfileButton(),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildRoundTextButton(
                  '판매내역',
                  FontAwesomeIcons.receipt,
                ),
                _buildRoundTextButton(
                  '구매내역',
                  FontAwesomeIcons.bagShopping,
                ),
                _buildRoundTextButton(
                  '관심목록',
                  FontAwesomeIcons.heart,
                ),
              ],
            ),
            // 라운드 텍스트 버튼
          ],
        ),
      ),
    );
  }

  Widget _buildProfileRow() {
    return Row(
      children: [
        Stack(
          children: [
            SizedBox(
              width: 65,
              height: 65,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(32.5),
                child: Image.network(
                  'https://picsum.photos/200/100',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.grey[100]),
                child: Icon(
                  CupertinoIcons.camera,
                  size: 15,
                ),
              ),
            )
          ],
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('이준석', style: textTheme().displayMedium),
            const SizedBox(height: 12),
            Text('망미동 #000912'),
          ],
        )
      ],
    );
  } // end of _buildProfileRow

  Widget _buildProfileButton() {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xFFD4D5DD),
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Center(
        child: Text(
          '프로필 보기',
          style: textTheme().titleMedium,
        ),
      ),
    );
  }

  _buildRoundTextButton(String title, IconData mIcon) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            color: Color.fromRGBO(255, 226, 108, 1),
            border: Border.all(
              width: 0.5,
              color: Colors.grey,
            ),
          ),
          child: Icon(
            mIcon,
            color: Colors.orange,
          ),
        ),
        Text(
          title,
          style: textTheme().titleMedium,
        ),
      ],
    );
  }
}
