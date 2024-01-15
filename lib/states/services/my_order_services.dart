import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/data/prefs.dart';
import 'package:dogventurehq/states/models/event_details_model.dart';
import 'package:dogventurehq/states/models/my_events_model.dart';
import 'package:dogventurehq/states/services/base_client.dart';

class MyOrderService {
  static Future<List<MyEventsModel>> getMyCurrentOrderList() async {
    var response = await BaseClient().get(
      '${ConstantStrings.kMyCurrentAppointmentApi}${Preference.getUserId()}&isService=false',
    );
    List<MyEventsModel> obj = myEventsModelFromJson(response.toString());
    return obj;
  }

  static Future<List<MyEventsModel>> getMyPreviousOrderList() async {
    var response = await BaseClient().get(
      '${ConstantStrings.kMyPreviousAppointmentApi}${Preference.getUserId()}&isService=false',
    );
    List<MyEventsModel> obj = myEventsModelFromJson(response.toString());
    return obj;
  }

  static Future<List<MyEventsModel>> getMyCancelOrderList() async {
    var response = await BaseClient().get(
      '${ConstantStrings.kMyCancelAppointmentApi}${Preference.getUserId()}&isService=false',
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
