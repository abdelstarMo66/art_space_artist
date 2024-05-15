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
  static const deleteProduct = 'products/me/{id}';
  static const getStyles = 'styles';
  static const getCategories = 'categories';
  static const getSubjects = 'subjects';
  //Events
  static const getEvents = 'events/me';
  static const getEventDetails = 'events/me/{id}';
  static const addEvent = 'events';
  static const deleteEvent = 'events/me/{id}';
  static const getUpcomingEvents = 'events/upcoming';
}