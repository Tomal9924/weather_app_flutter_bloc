class ApiConstants {
  static const String _baseUrl = "https://api.ieatery.com.bd/";
  static const String token = "token";
  static const String logout = "api/IeateryLogout";
  static const String changeDefaultRestaurant = "api/ChangeDefaultCompany";
  static const String changeOrderStatus = "api/ChangeOrderStatus";

  //--------------Save-------------------

  static const String saveItem = "api/SaveMenuItem";
  static const String updateRestaurantSettings = "api/UpdateRestaurantDetails";
  static const String saveCategory = "api/SaveCategories";
  static const String saveMenu = "api/SaveMenu";
  static const String deviceToken = "api/SaveDeviceLog";
  static const String saveToppings = "api/SaveTopping";
  static const String saveCoupon = "api/SaveCoupons";
  static const String postReview = "api/ReviewPostReply";
  static const String changeFoodItemStatus = "api/ItemStatusChange";
  static const String changeCategoryStatus = "api/CategoriesStatusChange";
  static const String changeCouponStatus = "api/CouponStatusChange";
  static const String deleteCoupon = "api/CouponDelete";
  static const String savePrimaryContact = "api/SavePrimaryContact";
  static const String restaurantStatus = "api/SaveRestaurantStatusLog";

  //--------------Get---------------------
  static const String delayOrder = "api/TimeChangeUserNotify";
  static const String uploadPhoto = "api/UploadFileFormData";
  static const String toppingsCategories = "api/GetAllToppingCategories";
  static const String orders = "api/GetAllOrders";
  static const String categories = "api/GetAllCategories";
  static const String getOrdersFilter = "api/GetAllOrdersFilter";
  static const String menus = "api/GetAllMenus";
  static const String foodItems = "api/GetAllItems";
  static const String orderItems = "api/GetOrderDetail";
  static const String profile = "api/GetUserByUserName";
  static const String findRestaurants = "api/GetOrganizationList";
  static const String menuItemsData = "api/DashboardItemData";
  static const String categoriesDelete = "api/CategoriesDelete";
  static const String toppingsDelete = "api/ToppingCategoryDelete";
  static const String toppingCategoryDelete = "api/ToppingCategoryDelete";
  static const String getAllCoupons = "api/GetCouponList";
  static const String getAllReview = "api/GetReviewList";
  static const String getAllLocations = "api/GetLocationList";
  static const String getContactList = "api/GetAllContactList";
  static const String getRestaurantDetails = "api/GetRestaurantDetails";
  static const String lookup = "api/GetLookupbyKey";
  static const String changeRestaurantStatus = "api/LocationPaidOptionChange";

  static Uri url({required String api}) => Uri.parse("$_baseUrl$api");

  static String photo({required String path}) =>
      "${path.startsWith("http") ? "" : "https://api.ieatery.com.bd/"}$path".replaceAll("api.", "app.");
}
