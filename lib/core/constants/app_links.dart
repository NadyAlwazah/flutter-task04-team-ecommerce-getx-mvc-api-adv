class AppLinks {
  static const String baseUrl = 'https://api.escuelajs.co/api/v1';

  static const String products = '/products/';

  static const String categories = '/categories/';

  static String searchProducts(String query) => '/products/?title=$query';

  // Auth
  static const String signUp = '/users/';
  static const String login = '/auth/login';
  static const String profile = '/auth/profile';
}
