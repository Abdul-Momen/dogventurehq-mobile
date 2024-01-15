class ConstantStrings {
  static String kAgreeTermsTxt =
      'By Signing Up You Agree To Our Uer Agreement, Privacy Policy And Draw Terms & Conditions';
  static String kOtpScreenTxt =
      'Please type the verification code send to the ';
  static String kUploadPhotoSubtitle =
      'File Type .jpeg, .png (Max file size 25 MB).';

  static String kNoData = 'No Data ';

  static String kTermsAndConditions = "TermsConditions";
  static String kPrivacyAndPolicy = "PrivacyAndPolicy";
  static String kRefundAndCancel = "RefundAndCancel";
  static int kInvoiceStatusIdForCancel = 6;
  static String kContactUs = "Contact";

  // apis
  static String kBaseUrl = 'https://dogventurehq.com/admin';
  static String kEventsApi = '/api/v1/Events/4';
  static String kUserProfilePicChangeApi =
      '/api/v1/upload-customers-profile-picture';
  static String kPetImageUploadApi = '/api/v1/upload-customers-profile-picture';
  static String kPetMedicalImageUploadApi =
      '/api/v1/upload-pet-picture-and-medical-book';
  static String kParentCategoryApi = '/api/v1/ParentCategory/4';
  static String kWishListApi = '/api/v1/Events-wish-list/4/';
  static String kProductWishListApi = '/api/v1/wishlistproducts?userId=';
  static String kPetBreedListApi = '/api/v1/profile-breed-group';
  static String kDeleteEventsApi = '/api/v1/delete-order/';
  static String kEventCategoryApi = '/api/v1/ChildCategory/572/4';
  static String kEventsDetailsApi = '/api/v1/event-details/';
  static String kConsultationDetailsApi = '/api/v1/Product-Details?id=';
  static String kTrainingDetailsApi = '/api/v1/Product-Details?id=';
  static String kDayCareDetailsApi = '/api/v1/Product-Details?';
  static String kBlogListApi = '/api/v1/blog?languageId=4';
  static String kBlogDetailsApi = '/api/v1/blog-details/';
  static String kDayCareServiceListApi =
      '/api/v1/Products/4/2/13/1?categoryId=573';
  static String kGroomingServiceListApi =
      '/api/v1/Products/4/2/13/1?categoryId=586';
  static String kVetClinicServiceListApi =
      '/api/v1/Products/4/2/13/1?categoryId=570';
  static String kTrainingServiceListApi =
      '/api/v1/Products/4/2/13/1?categoryId=571';
  static String kOrderApi = '/api/v1/order';
  static String kUserProfileUpdateApi = '/api/v1/user-profile-update';
  static String kAddContact = '/api/v1/add-contact-us';
  static String kAddNewPetApi = '/api/v1/customer-profile-details-submit';
  static String kAddAddressApi = '/api/v1/delivery-address';
  static String kUpdateAddressApi = '/api/v1/update-delivery-address';
  static String kUpdatePetApi = '/api/v1/customer-profile-details-update';
  static String kAddFavoriteApi = '/api/v1/Events-Wish-list';
  static String kAddProductFavoriteApi = '/api/v1/wishlist/add-remove';
  static String kFilterProductApi = '/api/v1/Products-filter';
  static String kMyCurrentEventsApi = '/api/v1/Current-Events?userId=';
  static String kMyPreviousEventsApi = '/api/v1/Previous-Events?userId=';
  static String kMyCancelEventsApi = '/api/v1/Cancel-Events?userId=';
  static String kMyCurrentAppointmentApi = '/api/v1/latest-order?userId=';
  static String kMyPreviousAppointmentApi = '/api/v1/previous-order?userId=';
  static String kMyCancelAppointmentApi = '/api/v1/cancel-order?userId=';
  static String kPetsApi = '/api/v1/pet-details-list?customerId=';
  static String kAllRooms = '/api/v1/all-room';
  static String kWalletApi = '/api/v1/wallet?customerId=';
  static String kWalletTransactionApi =
      '/api/v1/wallet-transection-details?walletId=';

  static String kBannerApi = '/api/v1/banners';
  static String kStoreProductsApi = '/api/v1/Type-wise-Products/4/3/13/1/';
  static String kBrandsApi = '/api/v1/Brands';
  static String kNewArrivalProductsApi = '/api/v1/Type-wise-Products';
  static String kTopProductsApi = '/api/v1/Products';
  static String kStoreProductDetailsFeatureApi =
      '/api/v1/related-products?productMasterId=';
  static String kStoreProductDetailsApi = '/api/v1/Product-Details?id=';
  static String kPetTypeApi = '/api/v1/pet-type';
  static String kDeletePetsApi = '/api/v1/remove-from-customer-profile/';
  static String kDeleteAddressApi = '/api/v1/delete-delivery-address/';
  static String kLoginApi = '/api/v1/customer-login';
  static String kForgetPasswordApi = '/api/v1/forget-password?';
  static String kRegistrationApi = '/api/v1/customer-register';
  static String kFilterEventApi = '/api/v1/Events-filter';
  static String kActivityWaiverApi = '/api/v1/event-activity-waiver-submit';
  static String kTermsConditionsApi = '/api/v1/web-html/';
  static String kAddToReviewApi = '/api/v1/add-to-review';
  static String kAddToCartApi = '/api/v1/add-to-cart';
  static String kRemoveAllFromCartApi = '/api/v1/remove-all-from-cart';
  static String kRemoveFromCartApi = '/api/v1/remove-from-cart/';
  static String kGetCartItemApi = '/api/v1/cart-items?customerId=';
  static String kGetDeliveryAddressApi = '/api/v1/delivery-address?customerId=';
  static String kAddDeliveryAddressApi = '/api/v1/delivery-address';
  static String kCountryListAddressApi = '/api/v1/country';
  static String kStateListAddressApi = '/api/v1/state/';
  static String kCityListAddressApi = '/api/v1/city/';

  // payment
  static String kOrderPayment = '/api/v1/order-payment?customerId=';
  static String kPaymentStatus = '/api/v1/order-payment-checking?reference=';

  //fonts
  static String kAppFont = 'BebasNeue';
  static String kAppFontPoppins = 'Poppins';
  static String kAppFontBarbesNeuekai = 'BerbasNeuekai';

  //other
  static String kAboutEventTxt =
      'Lorem ipsum dolor sit amet,  consectetur adipiscing elit. Suspendisse nisi magna, hendrerit non mattis id, sagittis sit amet lectus.\n\n Morbi aliquam aliquet hendrerit. Mauris molestie iaculis est. Fusce nuncleo, lacinia vitae risus et, lobortis consectetur lorem. Etiam volutpat  maximus nulla, sit amet interdum ipsum malesuada.';
}
