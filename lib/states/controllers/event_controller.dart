import 'package:dogventurehq/states/models/activity_waiver_model.dart';
import 'package:dogventurehq/states/models/event_category_model.dart';
import 'package:dogventurehq/states/models/event_details_model.dart';
import 'package:dogventurehq/states/models/event_model.dart';
import 'package:dogventurehq/states/models/favorite_model.dart';
import 'package:dogventurehq/states/models/get_order_model.dart';
import 'package:dogventurehq/states/models/my_events_model.dart';
import 'package:dogventurehq/states/models/order_model.dart';
import 'package:dogventurehq/states/services/event_services.dart';
import 'package:dogventurehq/states/services/my_event_services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EventController extends GetxController {
  RxBool eventLoadingFlag = true.obs;
  RxBool wishlistLoadingFlag = true.obs;
  RxBool deleteEventLoadingFlag = true.obs;
  RxBool eventCategoryLoadingFlag = true.obs;
  RxBool eventDetailsLoadingFlag = true.obs;
  RxBool eventBookingLoadingFlag = true.obs;
  RxBool eventFavoriteLoadingFlag = true.obs;
  RxBool isFavoriteLoadingFlag = true.obs;
  RxBool eventActivityWaiverLoadingFlag = true.obs;

  RxBool myCurrentEventLoadingFlag = true.obs;
  RxBool myPreviousEventLoadingFlag = true.obs;
  RxBool myCancelEventLoadingFlag = true.obs;
  RxBool myEventDetailsLoadingFlag = true.obs;
  RxBool postBookingEventLoadingFlag = true.obs;

  String? startDate;
  String? startTime;

  String? deleteResponse;

  RxDouble eventPrice = 0.0.obs;
  RxDouble totalPrice = 0.0.obs;

  var counter = RxInt(1);
  var numberOfDog = RxInt(0);

  var myCurrentEventList = <MyEventsModel>[].obs;
  var myPreviousEventList = <MyEventsModel>[].obs;
  var myCancelEventList = <MyEventsModel>[].obs;

  List<EventModel> eventList = <EventModel>[].obs;
  List<EventModel> wishList = <EventModel>[].obs;

  var eventCategoryList = <EventCategory>[].obs;

  EventDetails? eventDetails;

  FavoriteModel? favoriteList;

  GetOders? getOderList;
  ActivityWaiverModel? activityWaiverModelList;

  @override
  void onInit() {
    super.onInit();
/*  getEventList();
    getWishList();
    getEventCategoryList();
    getMyCurrentEventList();
    getMyPreviousEventList();
    getMyCancelEventList();*/
  }

  void getMyCurrentEventList() async {
    myCurrentEventLoadingFlag.value = true;
    try {
      myCurrentEventList.value = await MyEventService.getMyCurrentEventList();
    } finally {
      myCurrentEventLoadingFlag.value = false;
    }
  }

  void getMyPreviousEventList() async {
    myPreviousEventLoadingFlag.value = true;
    try {
      myPreviousEventList.value = await MyEventService.getMyPreviousEventList();
    } finally {
      myPreviousEventLoadingFlag.value = false;
    }
  }

  void getMyCancelEventList() async {
    myCancelEventLoadingFlag.value = true;
    try {
      myCancelEventList.value = await MyEventService.getMyCancelEventList();
    } finally {
      myCancelEventLoadingFlag.value = false;
    }
  }

  void getFilterEvent(int subCatId) async {
    eventLoadingFlag.value = true;
    try {
      eventList = await EventService.getFilterEvent(subCatId);
      // print('Response Model: $eventList');
    } finally {
      eventLoadingFlag.value = false;
    }
  }

  void deleteEvent(int invoicedId) async {
    deleteEventLoadingFlag.value = true;
    try {
      deleteResponse = await EventService.deleteEvent(invoicedId);
      // print('Response Model: $deleteResponse');
    } finally {
      deleteEventLoadingFlag.value = false;
    }
  }

  void postEventBooking(OrderModel payloadObj) async {
    print('payLoadObj: ${payloadObj.toJson()}');

    eventBookingLoadingFlag.value = true;
    try {
      getOderList = await EventService.postBookingEvent(payloadObj);
      // print('Response Model: ${getOderList!.toJson()}');
    } finally {
      eventBookingLoadingFlag.value = false;
    }
  }

  void addFavoriteEvent(FavoriteModel payloadObj) async {
    eventFavoriteLoadingFlag.value = true;
    try {
      favoriteList = await EventService.addFavoriteEvent(payloadObj);
      // print('Response Model: ${favoriteList!.toJson()}');
    } finally {
      eventFavoriteLoadingFlag.value = false;
    }
  }

  void postEventActivityWaiver(ActivityWaiverModel payloadObj) async {
    eventActivityWaiverLoadingFlag.value = true;
    try {
      activityWaiverModelList =
          await EventService.postActivityWaiver(payloadObj);
      // print('Response Model: ${activityWaiverModelList!.toJson()}');
    } finally {
      eventActivityWaiverLoadingFlag.value = false;
    }
  }

  void getEventCategoryList() async {
    eventCategoryLoadingFlag.value = true;
    try {
      eventCategoryList.value = await EventService.getEventsCategory();
    } finally {
      eventCategoryLoadingFlag.value = false;
    }
  }

  void getEventList() async {
    eventLoadingFlag.value = true;
    try {
      eventList = await EventService.getEvents();
    } finally {
      eventLoadingFlag.value = false;
    }
  }

  void getWishList() async {
    wishlistLoadingFlag.value = true;
    try {
      wishList = await EventService.getWishList();
    } finally {
      wishlistLoadingFlag.value = false;
    }
  }

  void getEventDetails(String guidId, String customerId) async {
    eventDetailsLoadingFlag.value = true;
    try {
      eventDetails = await EventService.getEventsDetails(guidId, customerId);

      final dateTimeString = eventDetails!.startDate!;
      final time = DateTime.parse(dateTimeString);

      final format = DateFormat('HH:mm a');
      startTime = format.format(time);

      var outputFormat = DateFormat(DateFormat.YEAR_ABBR_MONTH_DAY);
      startDate = outputFormat.format(time);

      // print(startDate);
      // print(startTime);
    } finally {
      totalEventPrice();

      eventDetailsLoadingFlag.value = false;
      isFavoriteLoadingFlag.value = false;
    }
  }

  void increment() {
    counter++;
  }

  void decrease() {
    if (counter != 1) {
      counter--;
    }
  }

  void dogIncrement() {
    numberOfDog++;
  }

  void dogDecrease() {
    if (numberOfDog != 0) {
      numberOfDog--;
    }
  }

  void totalEventPrice() {
    for (var i = 0;
        i < eventDetails!.eventTicketsProductMasterViewModels!.length;
        i++) {
      totalPrice.value = totalPrice.value +
          (double.parse(eventDetails!
                  .eventTicketsProductMasterViewModels![i].productPrice
                  .toString()) *
              double.parse(eventDetails!
                  .eventTicketsProductMasterViewModels![i].item
                  .toString()));
    }
  }
}
