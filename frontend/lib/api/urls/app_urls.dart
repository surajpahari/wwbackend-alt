//all the url needed for the apiCall
class Url {
  String value;
  Url(this.value);
}

class ApiUrls {
  ApiUrls._();
  static String baseUrl = "https://localhost:8000/api";
  static Url testUrl = Url('/api/test');
  static Url loginUrl = Url('/api/auth/login');
  static Url signupUrl = Url('/api/auth/register');
//for the tekt
}
