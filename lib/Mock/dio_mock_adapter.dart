// import 'package:dio/dio.dart';
// import 'package:dio/io.dart';
// import 'package:http/testing.dart';

// class DioMockAdapter {
//   Dio createDioWithMockAdapter(MockClient mockClient) {
//     final Dio dio = Dio();
//     dio.httpClientAdapter = IOHttpClientAdapter();
//     dio.interceptors
//         .add(InterceptorsWrapper(onRequest: (options, handler) async {
//       // You can customize the interceptors as needed
//       // For example, you might want to log requests or modify headers
//       return handler.next(options);
//     }));
//     dio.httpClientAdapter = DioAdapter(mockClient: mockClient);
//     return dio;
//   }
// }
