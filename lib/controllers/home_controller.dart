/*
* @author Ujjawal Panchal
* @Date 17/04/23
*/

import 'dart:convert';

import 'package:cricket_live_practical/constant/constants.dart';
import 'package:cricket_live_practical/models/team_item_pojo.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeDataController extends GetxController {
  List<TeamItemPojo>? teams;
  RxInt selectedTeam = 0.obs;
  var isDataLoading = true;

  @override
  Future<void> onInit() async {
    super.onInit();
    getCricketDataApi();
  }

  // Call API data from @baseUrls value selected from Constants class
  getCricketDataApi() async {
    try {
      isDataLoading = true;
      teams = [];
      update(['CricketList']);
      http.Response response = await http.get(Uri.tryParse(baseUrl)!);
      if (response.statusCode == 200) {
        manageCricketDataResponse(response.body);
      } else {
        CommonMethods.printLog('Something went wrong');
      }
    } catch (e) {
      CommonMethods.printLog('Error while getting data is --- $e');
    }
    isDataLoading = false;
    update(['CricketList']);
  }

  // Manage returned response from API
  String manageCricketDataResponse(String response) {
    var cricketData = jsonDecode(response);
    teams = [];
    cricketData['Teams'].forEach((key, value) {
      TeamItemPojo tIp = TeamItemPojo();
      tIp.nameFull = value['Name_Full'];
      tIp.nameShort = value['Name_Short'];
      tIp.players = [];
      value['Players'].forEach((key, valuePlayer) {
        Players player = Players.fromJson(valuePlayer);
        tIp.players!.add(player);
      });
      teams!.add(tIp);
    });
    return teams != null && teams!.isNotEmpty ? 'Data Parsed Successfully' : 'No Data Parsed';
  }
}
