import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/data/prefs.dart';
import 'package:dogventurehq/states/models/event_details_model.dart';
import 'package:dogventurehq/states/models/my_events_model.dart';
import 'package:dogventurehq/states/services/base_client.dart';

class MyEventService {
  static Future<List<MyEventsModel>> getMyCurrentEventList() async {
    var response = await BaseClient().get(
      '${ConstantStrings.kMyCurrentEventsApi}${Preference.getUserId()}',
    );
    List<MyEventsModel> obj = myEventsModelFromJson(response.toString());
    return obj;
  }

  static Future<List<MyEventsModel>> getMyPreviousEventList() async {
    var response = await BaseClient().get(
      '${ConstantStrings.kMyPreviousEventsApi}${Preference.getUserId()}',
    );
    List<MyEventsModel> obj = myEventsModelFromJson(response.toString());
    return obj;
  }

  static Future<List<MyEventsModel>> getMyCancelEventList() async {
    var response = await BaseClient().get(
      '${ConstantStrings.kMyCancelEventsApi}${Preference.getUserId()}',
    );
    List<MyEventsModel> obj = myEventsModelFromJson(response.toString());
    return obj;
  }

  static Future<EventDetails> getEventsDetails(String gId) async {
    var response = await BaseClient().get(
      ConstantStrings.kEventsDetailsApi,
    );
    EventDetails obj = eventDetailsFromJson(response.toString());
    return obj;
  }
}
