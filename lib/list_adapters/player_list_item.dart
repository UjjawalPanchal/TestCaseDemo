/*
* @author Ujjawal Panchal
* @Date 17/04/23
*
* class contains view data for Payers view list item
*/
import 'package:cricket_live_practical/models/team_item_pojo.dart';
import 'package:flutter/material.dart';

class PlayerListItem extends StatelessWidget {
  final Players player;
  final bool isHeader;

  const PlayerListItem({Key? key, required this.player, this.isHeader = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Text(
        isHeader ? 'Players' : '${player.nameFull} ${player.highLiteLabel()}',
        style: isHeader
            ? TextStyle(
                color: Colors.grey[800],
                fontSize: 16,
                fontWeight: FontWeight.w700,
              )
            : TextStyle(
                color: player.isHighLite() ? Colors.blue : Colors.black,
                fontSize: 16,
                fontWeight: player.isHighLite() ? FontWeight.w600 : FontWeight.normal,
              ),
      ),
    );
  }
}
