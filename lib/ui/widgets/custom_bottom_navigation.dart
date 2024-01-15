
import 'package:dogventurehq/states/data/prefs.dart';
import 'package:dogventurehq/states/models/customer_model.dart';
import 'package:dogventurehq/states/models/event_details_model.dart';
import 'package:dogventurehq/states/models/event_model.dart';
import 'package:dogventurehq/ui/screens/home/home.dart';
import 'package:dogventurehq/ui/screens/home/nav_icon.dart';
import 'package:dogventurehq/ui/screens/membership/membership.dart';
import 'package:dogventurehq/ui/screens/services/services.dart';
import 'package:dogventurehq/ui/screens/store/store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomBottomNavigation extends StatefulWidget {
  int selectedNavIndex;

  CustomBottomNavigation({
    Key? key,
    required this.selectedNavIndex,
  }) : super(key: key);

  @override
  State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {

  int get selectedNavIndex => widget.selectedNavIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          NavIcon(
            isSelected: selectedNavIndex == 0,
            icon: 'assets/svg/home.svg',
            title: 'Home',
            onTapFn: () =>
                setState(() {
                  widget.selectedNavIndex = 0;
                  Get.to(HomeScreen());
                }),
          ),
          NavIcon(
            isSelected: widget.selectedNavIndex == 1,
            icon: 'assets/svg/services.svg',
            title: 'Services',
            onTapFn: () =>
                setState(() {
                  // widget.selectedNavIndex = 1;
                  Get.to(ServicesPage());
                }),

          ),
          NavIcon(
            isSelected: widget.selectedNavIndex == 2,
            icon: 'assets/svg/membership.svg',
            title: 'Membership',
            onTapFn: () =>
                setState(() {
                  // widget.selectedNavIndex = 2;
                  Get.to(Membership());
                }),
          ),
          NavIcon(
            isSelected: widget.selectedNavIndex == 3,
            icon: 'assets/svg/store.svg',
            title: 'Store',
            onTapFn: () =>
                setState(() {
                   widget.selectedNavIndex = 3;
                   Get.to(StorePage());
                  // Preference.setUserDetails(CustomerModel(
                  //     customerId: 13,
                  //     userName: 'userName',
                  //     firstName: 'firstName',
                  //     middleName: 'middleName',
                  //     lastName: 'lastName',
                  //     email: 'email',
                  //     email2: 'email2',
                  //     phoneNo: 'phoneNo',
                  //     phoneNo2: 'phoneNo2',
                  //     phoneNo3: 'phoneNo3',
                  //     gender: 1,
                  //     password: 'password',
                  //     status: 'status',
                  //     createdAt: 'createdAt',
                  //     updatedAt: 'updatedAt',
                  //     aboutCustomer: 'aboutCustomer',
                  //     firstLastName: 'firstLastName', customerAddressViewModel: null));
                 // var model = Preference.getUserDetails();

                  // Preference.setUserList(EventModel(eventId: 2,
                  //     guidId: 'sdf',
                  //     title: 'title',
                  //     description: 'description',
                  //     eventSmallImage: 'eventSmallImage',
                  //     eventMediumImage: 'eventMediumImage',
                  //     eventLargeImage: 'eventLargeImage',
                  //     startDate: 'startDate',
                  //     endDate: 'endDate',
                  //     startTime: 'startTime',
                  //     endTime: 'endTime',
                  //     address: 'address',
                  //     status: 'status',
                  //     totalTickets: 34,
                  //     totalSold: 34,
                  //     supplierId: 34,
                  //     storeId: 344,
                  //     eventOrganizer: 343,
                  //     phone: 'phone',
                  //     email: 'email',
                  //    ));

               //   print(model.toJson());

                }),
          ),
        ],
      ),
    );
  }
}
