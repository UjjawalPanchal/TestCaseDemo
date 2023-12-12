/*
* @author Ujjawal Panchal
* @Date 17/04/23
*
* class contains view data for Team selection view list item
*/
import 'package:cricket_live_practical/models/team_item_pojo.dart';
import 'package:flutter/material.dart';

class TeamListItem extends StatelessWidget {
  final TeamItemPojo team;
  final bool selection;
  final Function() callBack;

  const TeamListItem({Key? key, required this.team, required this.callBack, required this.selection}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        callBack.call();
      },
      child: Container(
        decoration: selection ? const BoxDecoration(border: Border(bottom: BorderSide(color: Colors.blue, width: 2))) : null,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.center,
        child: Text(
          '${team.nameFull}',
          style: TextStyle(
            color: selection ? Colors.blue : Colors.grey,
            fontSize: 16,
            fontWeight: selection ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
