class ApiConstant {
  //Base URL
  static const apiBaseURL = 'https://art-space-v9.onrender.com/api/v1/';
  //Auth end points
  static const login = 'artistAuth/login';
  static const register = 'artistAuth/signup';
  static const verifyEmail = 'artistAuth/verifyEmail';
  static const forgotPassword = 'artistAuth/forgotPassword';
  static const verifyCode = 'artistAuth/verifyCode';
  static const resetPassword = 'artistAuth/resetPassword';
  //Profile
  static const getProfile = 'artists/getProfile';
  static const updateProfile = 'artists/updateProfile';
  static const changePassword = 'artists/changePassword';
  //Products
  static const getProducts = 'products/me';
  static const getProductDetails = 'products/me/{id}';
  static const addProduct = 'products';
  static const updateProduct = 'products/me/{id}';
  static const deleteProduct = 'products/me/{id}';
  static const getStyles = 'styles';
  static const getCategories = 'categories';
  static const getSubjects = 'subjects';
  static const deleteSpecificImage = 'products/deleteSpecificImage/{id}';
  //Events
  static const getEvents = 'events/me';
  static const getEventDetails = 'events/me/{id}';
  static const createEvent = 'events';
  static const deleteEvent = 'events/me/{id}';
  static const getUpcomingEvents = 'events/upcoming';
  static const addProductToEvent = 'events/{eventId}/addProduct';

  //Auction
  static const getAuctions = 'auction/me';
  static const createAuction = 'auction';
  static const deleteAuction = 'auction/me/{id}';
  static const getAuctionDetails = 'auction/product/{id}';
}