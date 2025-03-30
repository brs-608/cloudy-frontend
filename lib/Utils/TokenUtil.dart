import 'package:shared_preferences/shared_preferences.dart';

class TokenUtil {
    static Future<void> saveToken(String token)async{
        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        await sharedPreferences.setString("token", token);
    }

     static Future<String?>getToken()async{
        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        return sharedPreferences.getString("token");

    }
    static Future<void> removeToken()async{
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      await sharedPreferences.remove("token");
    }
}