import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/controllers/my_wallet_controller.dart';
import 'package:dogventurehq/ui/screens/wallet/wallet_item.dart';
import 'package:dogventurehq/ui/widgets/custom_titlebar.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class MyWalletPage extends StatefulWidget {
  static String routeName = '/wallet';

  const MyWalletPage({Key? key}) : super(key: key);

  @override
  State<MyWalletPage> createState() => _MyWalletPageState();
}

class _MyWalletPageState extends State<MyWalletPage> {
  final MyWalletController _myWalletController = Get.find<MyWalletController>();

  bool isVisible=true;

  @override
  void initState() {
    //calling wallet
    _myWalletController.getWallet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: HexColor("#f5b342"),
        ),
        toolbarHeight: 122.h,
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        title: const CustomTitlebar(
            title: "Wallet", img_bg: 'assets/images/day_care_bg.png'),
      ),
      body: Obx(() {
        if (_myWalletController.myWalletLoadingFlag.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          if (_myWalletController.myWalletObj == null) {
            return const Center(child: Text('No data found'));
          } else {
            _myWalletController.getWalletTransaction(
                _myWalletController.myWalletObj!.walletId.toString());
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Avaiable balance",
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontFamily: ConstantStrings.kAppFontPoppins),
                      ),
                      Text(
                        "AED " +
                            _myWalletController.myWalletObj!.balance.toString(),
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 40.sp,
                            fontFamily: ConstantStrings.kAppFont),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      child: SizedBox(
                        height: 100.h,
                        width: 180.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                height: 30.h,
                                width: 40.w,
                                child: Image.asset('assets/images/in.png')),
                            Text(
                              "+AED " +
                                  _myWalletController.myWalletObj!.totalCredit
                                      .toString(),
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 25.sp,
                                  fontFamily: ConstantStrings.kAppFont),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      child: SizedBox(
                        height: 100.h,
                        width: 180.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                height: 30.h,
                                width: 40.w,
                                child: Image.asset('assets/images/out.png')),
                            Text(
                              "-AED " +
                                  _myWalletController.myWalletObj!.totalDebit
                                      .toString(),
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 25.sp,
                                  fontFamily: ConstantStrings.kAppFont),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                addH(10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50.h,
                      width: 100.w,
                      child: OutlinedButton(
                        onPressed: (){
                          setState(() {
                            isVisible=true;
                          });
                        },
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                              width: 1.0, color: isVisible?Colors.indigo:Colors.black26),
                          minimumSize: const Size.fromHeight(50),
                          backgroundColor: isVisible?Colors.indigo:Colors.white70,
                          shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(26.0),
                          ),
                        ),
                        child: Text(
                          'in',
                          style: TextStyle(
                              color: isVisible?Colors.white:Colors.indigo,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    addW(15.w),
                    SizedBox(
                      height: 50.h,
                      width: 100.w,
                      child: OutlinedButton(
                        onPressed: (){
                          setState(() {
                            isVisible=false;
                          });
                        },
                        style: OutlinedButton.styleFrom(
                          side:  BorderSide(
                              width: 1.0, color: isVisible?Colors.black26:Colors.indigo),
                          minimumSize: const Size.fromHeight(50),
                          backgroundColor:  isVisible?Colors.white:Colors.indigo,
                          shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(26.0),
                          ),
                        ),
                        child:  Text(
                          'Out',
                          style: TextStyle(
                              color: isVisible?Colors.indigo:Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
                addH(10.h),
                SizedBox(
                  height: 489.h,
                  width: double.infinity.w,
                  child: Obx(() {
                    if(_myWalletController.myWalletTransactionLoadingFlag.value){
                      return const Center(child: CircularProgressIndicator());
                    }else{
                      if(_myWalletController.transactionList.isNotEmpty){

                        List inList = _myWalletController.transactionList.where((o) => o.transactionType == 'Credit').toList();
                        List outList = _myWalletController.transactionList.where((o) => o.transactionType == 'Debit').toList();

                        if(isVisible){
                          return ListView.builder(
                              shrinkWrap: true,
                              itemCount: inList.length,
                              itemBuilder: (context, index) {
                                return  WalletItem(model: inList[index], isOut: false,);
                              });
                        }else{
                          return ListView.builder(
                              shrinkWrap: true,
                              itemCount: outList.length,
                              itemBuilder: (context, index) {
                                return  WalletItem(model: outList[index], isOut: true,);
                              });
                        }

                      }else{
                        return const Center(child: Text('No data found'));
                      }
                    }

                  }),
                ),
              ],
            );
          }
        }
      }),
    );
  }
}
