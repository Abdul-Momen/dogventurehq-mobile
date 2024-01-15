import 'dart:developer';

import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/data/prefs.dart';
import 'package:dogventurehq/states/models/activity_waiver_model.dart';
import 'package:dogventurehq/states/models/event_category_model.dart';
import 'package:dogventurehq/states/models/event_details_model.dart';
import 'package:dogventurehq/states/models/event_model.dart';
import 'package:dogventurehq/states/models/favorite_model.dart';
import 'package:dogventurehq/states/models/get_order_model.dart';
import 'package:dogventurehq/states/models/order_model.dart';
import 'package:dogventurehq/states/services/base_client.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class EventService {
  static Future<List<EventModel>> getEvents() async {
    var response = await BaseClient().get(
      ConstantStrings.kEventsApi,
    );
    List<EventModel> obj = eventModelFromJson(response.toString());
    return obj;
  }

  static Future<List<EventModel>> getWishList() async {
    var response = await BaseClient().get(
      '${ConstantStrings.kWishListApi}${Preference.getUserId()}?page=1&PageSize=20',
    );
    List<EventModel> obj = eventModelFromJson(response.toString());
    return obj;
  }

  static Future<List<EventCategory>> getEventsCategory() async {
    var response = await BaseClient().get(
      ConstantStrings.kEventCategoryApi,
    );
    List<EventCategory> obj = eventCategoryFromJson(response.toString());
    log('get final a response: ${response.toString()}');
    return obj;
  }

  static Future<EventDetails> getEventsDetails(
      String gId, String customerId) async {
    var response = await BaseClient().get(
      '${ConstantStrings.kEventsDetailsApi}$gId?customerId=$customerId',
    );
    EventDetails obj = eventDetailsFromJson(response.toString());
    return obj;
  }

  static Future<GetOders> postBookingEvent(OrderModel payloadObj) async {
    var response = await BaseClient().post(
      ConstantStrings.kOrderApi,
      payloadObj.toJson(),
    );
    // var jsonRes = jsonDecode(response);
    // OrderModel obj = orderModelFromJson(jsonEncode(jsonRes["order"]));
    // log('get final response: ${obj}');

    GetOders obj = getOdersFromJson(response.toString());
    return obj;
  }

  static Future<FavoriteModel> addFavoriteEvent(
      FavoriteModel payloadObj) async {
    var response = await BaseClient().post(
      ConstantStrings.kAddFavoriteApi,
      payloadObj.toJson(),
    );
    // var jsonRes = jsonDecode(response);
    // OrderModel obj = orderModelFromJson(jsonEncode(jsonRes["order"]));
    // log('get final response: ${obj}');

    FavoriteModel obj = favoriteModelFromJson(response.toString());
    return obj;
  }

  static Future<ActivityWaiverModel> postActivityWaiver(
      ActivityWaiverModel payloadObj) async {
    var response = await BaseClient().post(
      ConstantStrings.kActivityWaiverApi,
      payloadObj.toJson(),
    );
    // var jsonRes = jsonDecode(response);
    // OrderModel obj = orderModelFromJson(jsonEncode(jsonRes["order"]));
    // log('get final response: ${obj}');

    ActivityWaiverModel obj = activityWaiverModelFromJson(response.toString());
    return obj;
  }

  static Future<List<EventModel>> getFilterEvent(int subCatId) async {
    if (subCatId == 580) {
      subCatId = 0;
    }
    var input = {
      "categoryIds": [572],
      "categorySubIds": [subCatId]
    };
    var response = await BaseClient().post(
      ConstantStrings.kFilterEventApi,
      input,
    );
    List<EventModel> obj = eventModelFromJson(response.toString());

    return obj;
  }

  static Future<String> deleteEvent(int id) async {
    var response =
        await BaseClient().get('${ConstantStrings.kDeleteEventsApi}$id');

    String obj = response.toString();
    return obj;
  }
}
