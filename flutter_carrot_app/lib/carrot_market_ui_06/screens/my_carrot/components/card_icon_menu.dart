import 'package:flutter/material.dart';
import 'package:flutter_carrot_app/carrot_market_ui_01/theme.dart';
import '../../../models/icon_menu.dart';

class CardIconMenu extends StatelessWidget {
  final List<IconMenu> iconMenuList;

  const CardIconMenu({required this.iconMenuList, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      child: Column(
        children: [
          ...List.generate(
            iconMenuList.length,
            (index) => _buildRowIconItem(
              iconMenuList[index],
            ),
          ),
        ],
      ),
    );
  }

  _buildRowIconItem(item) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: InkWell(
        onTap: () {
          return print('${item.title} 클릭');
        },
        child: Row(
          children: [
            Icon(item.iconData),
            const SizedBox(
              width: 16.0,
            ),
            Text(
              '${item.title}',
              style: textTheme().titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
