/*
* @author Ujjawal Panchal
* @Date 17/04/23
*
* File contains information about the API call endpoint url and some static methods
*/

import 'package:flutter/foundation.dart';

// const String baseUrl = 'https://www.sportsadda.com/cricket/live/json/sapk01222019186652.json';
const String baseUrl = 'https://www.sportsadda.com/cricket/live/json/sapk01222019186652.json';

class CommonMethods {
  // Print Log for debug mode app
  static void printLog(var log) {
    if (kDebugMode) {
      debugPrint('$log');
    }
  }
}
