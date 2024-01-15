import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/data/prefs.dart';
import 'package:dogventurehq/states/models/event_details_model.dart';
import 'package:dogventurehq/states/models/my_events_model.dart';
import 'package:dogventurehq/states/services/base_client.dart';

class MyAppointmentService {
  static Future<List<MyEventsModel>> getMyCurrentAppointmentList() async {
    var response = await BaseClient().get(
      '${ConstantStrings.kMyCurrentAppointmentApi}${Preference.getUserId()}&isService=true',
    );
    List<MyEventsModel> obj = myEventsModelFromJson(response.toString());
    return obj;
  }

  static Future<List<MyEventsModel>> getMyPreviousAppointmentList() async {
    var response = await BaseClient().get(
      '${ConstantStrings.kMyPreviousAppointmentApi}${Preference.getUserId()}&isService=true',
    );
    List<MyEventsModel> obj = myEventsModelFromJson(response.toString());
    return obj;
  }

  static Future<List<MyEventsModel>> getMyCancelAppointmentList() async {
    var response = await BaseClient().get(
      '${ConstantStrings.kMyCancelAppointmentApi}${Preference.getUserId()}&isService=true',
    );
    List<MyEventsModel> obj = myEventsModelFromJson(response.toString());
    return obj;
  }

  static Future<String> deleteAppointment(int id) async {
    var response =
        await BaseClient().get('${ConstantStrings.kDeleteEventsApi}$id');

    String obj = response.toString();
    return obj;
  }
}
