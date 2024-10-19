import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  Future<SharedPreferences> getSharedPref() async {
    return await SharedPreferences.getInstance();
  }

  void setPrefValues(id, patientId, address, contact, is_verified, role) async {
    final pref = await getSharedPref();

    pref.setInt("userId", id);
    pref.setString("patientId", patientId);
    pref.setString("address", address);
    pref.setInt("contact", contact);
    pref.setInt("role", role);
    pref.setInt("is_verified", is_verified);
  }

  Future<bool> hasEverLoggedIn() async {
    final pref = await getSharedPref();
    if (pref.containsKey("userId")) {
      return true;
    } else {
      return false;
    }
  }

  Future<int> userId() async {
    final pref = await getSharedPref();
    final id = pref.getInt("userId");
    return id ?? 0;
  }

  Future<String?> patientId() async {
    final pref = await getSharedPref();
    final id = pref.getString("patientId");
    return id;
  }

  Future<bool> isVerified() async {
    final pref = await getSharedPref();
    final verified = pref.getInt("is_verified");
    if (verified == 1) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> logoutSharedPref() async {
    final prefs = await getSharedPref();
    await prefs.clear();
  }

  Future<void> setFcmToken(fcmtoken) async {
    final pref = await getSharedPref();

    if (!pref.containsKey("fcmToken")) {
      pref.setString("fcmToken", fcmtoken);
    }
  }

  Future<String?> getFcmToken() async {
    final pref = await getSharedPref();
    final token = pref.getString("fcmToken");
    return token;
  }
}
