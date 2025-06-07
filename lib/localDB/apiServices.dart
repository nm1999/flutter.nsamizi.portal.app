import 'package:dio/dio.dart';
import 'package:nsamiziportal/localDB/api_constants.dart';

class ApiService {
  final Dio dio = Dio();

  Future<bool> addNewStudent(formdata) async {
    Response response = await dio.post(APIRoutes.addNewStudent, data: formdata);
    if (response.statusCode == 200) {
      print(response.data);
      return true;
    } else {
      return false;
    }
  }

  Future<bool> addExpenditureRecord(formdata) async {
    return false;
  }

  Future getAccountability() async {
    // final formdata = FormData.fromMap({
    //   'note':""
    // });

    return [];
  }

  Future<List> fetchNotification() async  {
    return [];
  }
}
