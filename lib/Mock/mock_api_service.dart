// // mock_api_service.dart
// import 'package:dio/dio.dart';
// import 'package:http/testing.dart';
// import '../Models/userModel.dart';
// import 'dio_mock_adapter.dart';


// class MockApiService {
//   static final Dio _dio = DioMockAdapter().createDioWithMockAdapter(MockClient());

//   static Future<User?> login(String email, String password) async {
//     final response = await _dio.post('/login', data: {'email': email, 'password': password});
//     // Parse response and return User object
//     // Example:
//     // return User.fromJson(response.data);
//   }

//   static Future<User?> register(String name, String email, String mobile) async {
//     final response = await _dio.post('/register', data: {'name': name, 'email': email, 'mobile': mobile});
//     // Parse response and return User object
//     // Example:
//     // return User.fromJson(response.data);
//   }
// }
