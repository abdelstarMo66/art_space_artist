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
  //Home end points
 static const getProfile = 'artists/getProfile';
 static const getProducts = 'products/me';
}