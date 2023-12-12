// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:cricket_live_practical/controllers/home_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('getCricketDataApi', () {
    test('test cricket live players data successful', () async {
      final controller = HomeDataController();
      String response = '''{
                            "Teams": {
                              "6": {
                                "Name_Full": "Pakistan",
                                "Name_Short": "PAK",
                                "Players": {
                                  "4038": {
                                    "Position": "6",
                                    "Name_Full": "Sarfraz Ahmed",
                                    "Iscaptain": true,
                                    "Iskeeper": true,
                                    "Batting": {
                                      "Style": "RHB",
                                      "Average": "32.81",
                                      "Strikerate": "86.04",
                                      "Runs": "1936"
                                    },
                                    "Bowling": {
                                      "Style": "",
                                      "Average": "0",
                                      "Economyrate": "7.5",
                                      "Wickets": "0"
                                    }
                                  }
                                }
                              }
                            }
                          }''';

      expect(controller.manageCricketDataResponse(response), 'Data Parsed Successfully');
    });
  });
}
