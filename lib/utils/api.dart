import 'package:dio/dio.dart';

postImage(FormData body) async {
  final dio = new Dio();
  dio.options.headers['Content-Type'] = 'multipart/form-data';

  // Todo: diganti ya linknya
  String url = 'link postnya';

  Response response = await dio.post(url, data: body);
  return response;
}
