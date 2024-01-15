import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/helper/dialog_helper.dart';
import 'package:dogventurehq/states/controllers/address_controller.dart';
import 'package:dogventurehq/states/data/prefs.dart';
import 'package:dogventurehq/states/models/customer_address_model.dart';
import 'package:dogventurehq/ui/screens/add_address/add_address.dart';
import 'package:dogventurehq/ui/widgets/custom_adress_text.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class PaymentAddressItem extends StatefulWidget {
  final CustomerAddressModel model;

  final bool isSelectFlag;
  const PaymentAddressItem({Key? key, required this.model, required this.isSelectFlag}) : super(key: key);


  @override
  State<PaymentAddressItem> createState() => _PaymentAddressItemState();
}

class _PaymentAddressItemState extends State<PaymentAddressItem> {
  final AddressController _addressController = Get.put(AddressController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        height: 100.h,
        width: double.infinity.w,
        decoration: BoxDecoration(
          border: Border.all(
            width: 2.0,
            color: HexColor('#155D84'),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(
            5.0,
          ) //<--- border radius here
          ),
        ),
        child: Row(
          children: [
            Flexible(
              flex: 1,
              child: Radio(
                  activeColor: widget.isSelectFlag?
                       Colors.orange
                      : Colors.grey,
                  value: 2,
                  groupValue: 2,
                  onChanged: (value) {
                    print(value); //selected value
                  }),
            ),
            addW(10.w),
            Flexible(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.model.addressType,
                    style: TextStyle(
                      color: widget.isSelectFlag
                          ? Colors.orange
                          : Colors.black,
                      fontSize: 18.sp,
                      fontFamily: ConstantStrings.kAppFont,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        Preference.getNameFlag(),
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: ConstantStrings.kAppFontPoppins,
                          fontSize: 14.sp,
                        ),
                      ),
                      addW(10.w),
                      CustomIconWithText(
                        address: Preference.getPhoneFlag(),
                        logo: "assets/svg/call.svg",
                      )
                    ],
                  ),
                  CustomIconWithText(address: widget.model.address + ',')
                ],
              ),
            ),
            Flexible(
              flex: 2,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 40.h,
                      width: 40.w,
                      child: RawMaterialButton(
                        onPressed: () {},
                        elevation: 2.0,
                        fillColor: Colors.white,
                        padding: const EdgeInsets.all(5.0),
                        shape: const CircleBorder(),
                        child: InkWell(
                          onTap: () {
                            _addressController
                                .addressDelete(widget.model.customerAddressId);
                            DialogHelper.showConfirmDialog(rightBtnPressed: () {
                              Get.defaultDialog(
                                  title: 'Processing..',
                                  content: Obx(() {
                                    if (_addressController
                                        .addressDeleteLoadingFlag.value) {
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    } else {
                                      if (_addressController
                                          .deleteResponse!.isNotEmpty) {
                                        Future.delayed(
                                            const Duration(seconds: 0),
                                                () async {
                                              Get.back();
                                              Get.back();
                                              _addressController
                                                  .getDeliveryAddressList();
                                            });

                                        return const Text('Success');
                                      } else {
                                        return const Text('Failed');
                                      }
                                    }
                                  }),
                                  radius: 10.0);
                            }, leftBtnPressed: () {
                              if (Get.isDialogOpen!) Get.back();
                            });
                          },
                          child: const Icon(
                            Icons.delete,
                            size: 15.0,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 40.h,
                    width: 40.w,
                    child: RawMaterialButton(
                      onPressed: () {},
                      elevation: 2.0,
                      fillColor: Colors.white,
                      padding: const EdgeInsets.all(5.0),
                      shape: const CircleBorder(),
                      child: InkWell(
                        onTap: () {
                          Get.to(AddAddress(
                            addAddressModel: widget.model,
                          ));
                        },
                        child: const Icon(
                          Icons.edit,
                          size: 15.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
