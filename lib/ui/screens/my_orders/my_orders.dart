import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/controllers/my_order_controller.dart';
import 'package:dogventurehq/ui/screens/my_orders/order_tab_item.dart';
import 'package:dogventurehq/ui/widgets/custom_titlebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hexcolor/hexcolor.dart';

class MyOrderPage extends StatefulWidget {
  const MyOrderPage({Key? key}) : super(key: key);

  @override
  State<MyOrderPage> createState() => _MyOrderPageState();
}

class _MyOrderPageState extends State<MyOrderPage> {

 final MyOrderController _myOrderController=Get.put(MyOrderController());
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: HexColor("#F98C10"),
          ),
          toolbarHeight: 129.h,
          backgroundColor: Colors.white,
          elevation: 0,
          titleSpacing: 0,
          automaticallyImplyLeading: false,
          title: const CustomTitlebar(
            title: 'My Order',
            img_bg: 'assets/images/store_bg.png',
          ),
          bottom: TabBar(
            indicatorColor: Colors.green,
            indicatorWeight: 4,
            labelColor: Colors.green,
            unselectedLabelColor: Colors.black,
            tabs: [
              Tab(
                child: Text(
                  'CURRENT',
                  style: TextStyle(
                      fontSize: 22.sp, fontFamily: ConstantStrings.kAppFont),
                ),
              ),
              Tab(
                child: Text(
                  'PREVIOUS',
                  style: TextStyle(
                      fontSize: 22.sp, fontFamily: ConstantStrings.kAppFont),
                ),
              ),
              Tab(
                child: Text(
                  'CANCELLED',
                  style: TextStyle(
                      fontSize: 22.sp, fontFamily: ConstantStrings.kAppFont),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Obx(() {
              if(_myOrderController.myCurrentOrderLoadingFlag.value){
                return Center(child: CircularProgressIndicator());
              }else{
                if(_myOrderController.myCurrentOrderList.isEmpty){
                  return Text('no data found...');
                }else{
                  return ListView.builder(
                      itemCount: _myOrderController.myCurrentOrderList.length,
                      itemBuilder: (context, index) {
                        return OrderTabItem(model: _myOrderController.myCurrentOrderList[index],);
                      });
                }
              }
            }),
            Obx(() {
              if(_myOrderController.myPreviousOrderLoadingFlag.value){
                return Center(child: CircularProgressIndicator());
              }else{
                if(_myOrderController.myPreviousOrderList.isEmpty){
                  return Text('no data found...');
                }else{
                  return ListView.builder(
                      itemCount: _myOrderController.myPreviousOrderList.length,
                      itemBuilder: (context, index) {
                        return OrderTabItem(model: _myOrderController.myPreviousOrderList[index],);
                      });
                }
              }
            }),
            Obx(() {
              if(_myOrderController.myCancelOrderLoadingFlag.value){
                return Center(child: CircularProgressIndicator());
              }else{
                if(_myOrderController.myCancelOrderList.isEmpty){
                  return Text('no data found...');
                }else{
                  return ListView.builder(
                      itemCount: _myOrderController.myCancelOrderList.length,
                      itemBuilder: (context, index) {
                        return OrderTabItem(model: _myOrderController.myCancelOrderList[index],);
                      });
                }
              }
            }),

          ],
        ),
      ),
    );
  }
}

