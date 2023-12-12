/*
* @author Ujjawal Panchal
* @Date 17/04/23
*/
import 'package:cricket_live_practical/controllers/home_controller.dart';
import 'package:cricket_live_practical/list_adapters/player_list_item.dart';
import 'package:cricket_live_practical/list_adapters/team_list_items.dart';
import 'package:cricket_live_practical/models/team_item_pojo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeDataController hController = Get.put(HomeDataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(title: const Text('Cricket Live')),
      body: GetBuilder<HomeDataController>(
          id: 'CricketList',
          init: hController,
          builder: (value) {
            if (value.isDataLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              margin: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    height: 60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.shade300, width: 1))),
                    child: GetBuilder<HomeDataController>(
                        id: 'TeamList',
                        init: hController,
                        builder: (value) {
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: value.teams!.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return TeamListItem(
                                team: value.teams![index],
                                selection: value.selectedTeam.value == index,
                                callBack: () {
                                  value.selectedTeam.value = index;
                                  value.update(['TeamList']);
                                },
                              );
                            },
                          );
                        }),
                  ),
                  Expanded(
                    child: Obx(() => IndexedStack(
                          index: hController.selectedTeam.value,
                          children: [
                            for (int i = 0; i < hController.teams!.length; i++) ...{
                              getPlayerListView(hController.teams![hController.selectedTeam.value].players!),
                            }
                          ],
                        )),
                  )
                ],
              ),
            );
          }),
    );
  }

  Widget getPlayerListView(List<Players> players) {
    return ListView.separated(
      itemCount: players.length + 1,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return PlayerListItem(player: players[index], isHeader: true);
        }

        return PlayerListItem(player: players[index - 1]);
      },
      separatorBuilder: (BuildContext context, int index) => index == 0 ? Divider(height: 1, color: Colors.grey[300]) : const SizedBox(),
    );
  }
}
