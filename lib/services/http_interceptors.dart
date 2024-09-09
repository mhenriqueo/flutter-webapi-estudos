import 'package:http_interceptor/http_interceptor.dart';
import 'package:logger/logger.dart';

class LoggerInterceptor extends InterceptorContract {

  Logger logger = Logger();

  @override
  Future<RequestData> interceptRequest({required RequestData data,}) async {

    logger.v(
        "------------------- Request -------------------\n"
        "Método: ${data.method}\n"
        "Requisição para: ${data.baseUrl}\n"
        "Cabeçalhos: ${data.headers}\n"
        "Corpo: ${data.body}"
    );

    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data,}) async {

    if(data.statusCode ~/ 100 == 2){
      logger.i(
          "------------------- Response -------------------\n"
          "Status Code: ${data.statusCode}\n"
          "Resposta de: ${data.url}\n"
          "Cabeçalhos: ${data.headers}\n"
          "Corpo: ${data.body}"
      );
    } else {
      logger.e(
          "------------------- Response -------------------\n"
          "Status Code: ${data.statusCode}\n"
          "Resposta de: ${data.url}\n"
          "Cabeçalhos: ${data.headers}\n"
          "Corpo: ${data.body}"
      );
    }

    return data;
  }
}