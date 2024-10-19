import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio();

  Future<bool> backUpReminder(formdata) async {
    Response response = await dio.post(
        "https://adherence.climatechangeactionafrica.org/v1/backup_reminders.php",
        data: formdata);
    if (response.statusCode == 200) {
      print(response.data);
      return true;
    } else {
      return false;
    }
  }
}
