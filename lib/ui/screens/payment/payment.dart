import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/controllers/addToCartController.dart';
import 'package:dogventurehq/states/controllers/address_controller.dart';
import 'package:dogventurehq/states/controllers/store_controller.dart';
import 'package:dogventurehq/states/methods/all_methods.dart';
import 'package:dogventurehq/states/models/cartRequestModel.dart';
import 'package:dogventurehq/states/models/customer_address_model.dart';
import 'package:dogventurehq/states/models/store_order_model.dart';
import 'package:dogventurehq/ui/screens/payment/payment_address_item.dart';
import 'package:dogventurehq/ui/screens/payment/row_item.dart';
import 'package:dogventurehq/ui/screens/thank_you/thank_you.dart';
import 'package:dogventurehq/ui/widgets/custom_bottom_btn.dart';
import 'package:dogventurehq/ui/widgets/custom_payment.dart';
import 'package:dogventurehq/ui/widgets/custom_titlebar.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../states/controllers/registration_controller.dart';
import '../../../states/data/prefs.dart';
import '../../../states/models/registration_model.dart';
import '../../widgets/custom_btn.dart';

class PaymentPage extends StatefulWidget {
  static String routeName = '/payment';

  const PaymentPage({
    Key? key,
  }) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  int numOfTicket = 0;

  // List<InvoiceRequestModel> invoiceList = List.empty(growable: true);
  List<InvoiceDetailsRequestModel> invoiceProductList =
      List.empty(growable: true);

  List<RegistrationModel> regModels = List.empty(growable: true);
  List<TextEditingController> nameTextController = List.empty(growable: true);
  List<TextEditingController> mobileTextController = List.empty(growable: true);
  List<TextEditingController> emailTextController = List.empty(growable: true);
  List<int> selectPetController = List.empty(growable: true);

  List<String> petNameList = List.empty(growable: true);

  final RegistrationController _regCon = Get.put(RegistrationController());
  final AddToCartController _cartController = Get.put(AddToCartController());

  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  int? screenNumValue;
  double? totalPrice;
  var data;
  final StoreController _storeController = Get.put(StoreController());
  final AddressController _addressController = Get.put(AddressController());

  CustomerAddressModel? _selectedAddress;

  bool _isOnline = true;

  @override
  void initState() {
    super.initState();
    data = Get.arguments;
    screenNumValue = data[0];
    totalPrice = data[1];

    _addressController.getDeliveryAddressList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor:
              HexColor(AllMethods.getStatusBarColor(screenNumValue!)),
        ),
        toolbarHeight: 122.h,
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        title: CustomTitlebar(
          title: "PAYMENT",
          img_bg: AllMethods.changeAppbarImage(screenNumValue!),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 757.h,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      addH(30.h),
                      CustomPaymentItem(
                        totalPrice: totalPrice,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'SELECT PAYMENT',
                            style: TextStyle(
                              fontFamily: ConstantStrings.kAppFont,
                              fontSize: 25.sp,
                            ),
                          ),
                          Row(
                            children: [
                              Checkbox(
                                value: _isOnline,
                                onChanged: (value) => setState(
                                  () => _isOnline = value!,
                                ),
                              ),
                              const Text(
                                'Online',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                ),
                              ),
                              addW(10.w),
                              Checkbox(
                                value: !_isOnline,
                                onChanged: (value) => setState(
                                  () => _isOnline = !value!,
                                ),
                              ),
                              const Text(
                                'Wallet',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          if (!_isOnline)
                            Card(
                              shape: const RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Colors.orange,
                                  width: 2,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.ac_unit,
                                      color: Colors.orange,
                                    ),
                                    addW(10.w),
                                    Text(
                                      'USE THE WALLET',
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          fontFamily: ConstantStrings.kAppFont,
                                          letterSpacing: 0),
                                    )
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                      addH(30.h),
                      if (screenNumValue == 4)
                        Column(
                          children: [
                            const AddressRowBtn(),
                            addH(20.h),
                            Obx(() {
                              if (_addressController
                                  .deliveryAddressListLoadingFlag.value) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              } else {
                                if (_addressController
                                    .deliveryAddressList.isEmpty) {
                                  return const Text('no data found...');
                                } else {
                                  if (_selectedAddress == null &&
                                      _addressController
                                          .deliveryAddressList.isNotEmpty) {
                                    _selectedAddress = _addressController
                                        .deliveryAddressList[0];
                                  }
                                  return ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      physics: const ClampingScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: _addressController
                                          .deliveryAddressList.length,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () {
                                            setState(() {
                                              _selectedAddress =
                                                  _addressController
                                                          .deliveryAddressList[
                                                      index];
                                            });
                                          },
                                          child: PaymentAddressItem(
                                            model: _addressController
                                                .deliveryAddressList[index],
                                            isSelectFlag: _selectedAddress ==
                                                _addressController
                                                    .deliveryAddressList[index],
                                          ),
                                        );
                                      });
                                  // return PaymentAddressItem();
                                }
                              }
                            }),
                          ],
                        ),
                      addH(50.h),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: CustomBottomBtn(
          lftBtnTxt: 'Cancel',
          lftBtnFn: () {},
          rightBtnTxt: 'Pay Now',
          rightBtnFn: () {
            _storeOrder();
          }),
    );
  }

  void _storeOrder() {
    if (_storeController.cartList.isNotEmpty) {
      invoiceProductList.clear();
      for (int i = 0; i < _storeController.cartList.length; i++) {
        invoiceProductList.add(InvoiceDetailsRequestModel(
          invoiceDetailsId: 0,
          invoiceId: 0,
          productMasterId: _storeController.cartList[i].productMasterId,
          quantity: _storeController.cartList[i].quantity.toInt(),
          price: _storeController.cartList[i].price *
              _storeController.cartList[i].quantity.toInt(),
          status: '',
          productSubSkuId: _storeController.cartList[i].productSubSKUId,
          createdAt: '',
          productName: _storeController.cartList[i].productName,
          largeImage: _storeController.cartList[i].smallImage,
          subSku: null,
          guidId: null,
        ));
      }
    }

    StoreOrderModel storeOrder = StoreOrderModel(
      invoiceMasterId: 0,
      customerId: Preference.getUserId(),
      refNumber: null,
      invoiceDate: null,
      invoiceStatusId: 0,
      totalAmount: totalPrice ?? 0,
      receivedAmt: totalPrice ?? 0,
      courierCharge: 0,
      carryingCost: 0,
      paymentMethod: null,
      remark: null,
      discountCode: null,
      discountValue: null,
      paymentStatus: null,
      status: '',
      orderFrom: "App",
      orderSource: "Store",
      createdAt: null,
      countryId: null,
      stateId: null,
      cityId: null,
      eventId: null,
      membershipId: null,
      membershipFacilitiesId: null,
      firstName: null,
      lastName: null,
      phone: null,
      email: null,
      address: null,
      postalCode: null,
      createAccount: false,
      password: null,
      userName: null,
      newPassword: null,
      paymentMethodId: null,
      addressType: null,
      buildingName: null,
      flatNo: null,
      customerAddressId: 0,
      packageId: null,
      invoiceRequestModels: [
        InvoiceRequestModel(
          invoiceId: 0,
          invoiceMasterId: null,
          refNumber: null,
          invoiceDate: null,
          totalAmount: totalPrice ?? 0,
          receivedAmt: 200,
          carryingCost: 0,
          courierCharge: 0,
          paymentMethod: 1,
          paymentStatus: null,
          remark: null,
          discountCode: null,
          discountValue: null,
          storeId: 40230,
          status: '',
          createdAt: null,
          supplierId: 10185,
          isService: false,
          serviceDate: null,
          serviceTimeString: null,
          ticketBuyForCustomerId: null,
          ticketOwnerName: null,
          ticketOwnerEmail: null,
          ticketOwnerPhone: null,
          eventPetDetailsRequestModels: [],
          invoiceDetailsRequestModels: invoiceProductList,
          packageItemRequestModels: [],
        )
      ],
      paymentRequestModels: [
        PaymentRequestModel(
          paymentId: 0,
          invoiceMasterId: null,
          currencyId: 1,
          amount: 0,
          courierCharge: 0,
          discountAmount: null,
          carryingCost: 0,
          paymentMethod: null,
          courierAgencyId: null,
          payDate: null,
          note: '',
          transactionNo: null,
          status: '',
          createdAt: null,
          couponId: null,
        )
      ],
      billingShippingAddressRequestModels: [
        BillingShippingAddressRequestModel(
          billingShippingAddressId: 0,
          invoiceMasterId: null,
          customerId: Preference.getUserId(),
          countryId: null,
          stateId: null,
          cityId: null,
          name: null,
          addressLine: null,
          addressLine2: null,
          landMark: null,
          deleveryNote: null,
          status: '',
          createdAt: null,
          updatedAt: null,
          zipCode: null,
          email: null,
          phoneNumber: null,
          isDefault: null,
          latitued: null,
          longitued: null,
          deleveryTime: null,
          isBilingAddress: true,
          isShippingAddress: true,
          customerAddressId: 0,
        )
      ],
      inputFieldValueRequestModels: [],
    );

    _storeController.productToOrder(storeOrder);

    Get.defaultDialog(
        title: 'Processing..',
        content: Obx(() {
          if (_storeController.storeOrderLoadingFlag.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (_storeController.orderObj != null) {
              print(_storeController.orderObj);
              Future.delayed(const Duration(seconds: 0), () async {
                CartRequestModel cartRequestModel = CartRequestModel(
                  cartId: _storeController.cartList[0].cartId,
                  productMasterId: _storeController.cartList[0].productMasterId,
                  customerId: Preference.getUserId(),
                  tempId: Preference.getUserId().toString(),
                  quantity: _storeController.cartList[0].quantity,
                  unitPrice: _storeController.cartList[0].price,
                  status: '',
                  productSubSKUId: _storeController.cartList[0].productSubSKUId,
                  currencyId: 0,
                  supplierId: 0,
                  storeId: 0,
                  serviceDateTime: '',
                  serviceTimeString: '',
                  isService: false,
                  eventId: 0,
                );
                _cartController.removeAllFromCart(cartRequestModel);
                Get.back();
                Get.offAndToNamed(ThankYou.routeName, arguments: [
                  2,
                  _storeController.orderObj!.order.refNumber,
                  _storeController.orderObj!.order.invoiceDate
                ]);
              });
              return const Text('success');
            } else {
              return Column(
                children: [
                  const Text('Loading... failed'),
                  addH(20.h),
                  CustomBtn(
                    btnFn: () {
                      Get.back();
                    },
                    btnText: 'Try Again',
                    btnBgClr: Colors.green,
                    btnSize: Size(120.w, 40.h),
                  )
                ],
              );
            }
          }
        }),
        radius: 10.0);
  }
}
