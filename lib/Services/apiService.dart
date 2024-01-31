// import 'package:dio/dio.dart';

// class ApiService {
//   final Dio dio;

//   ApiService(this.dio);

//   Future<bool> register({
//     required String name,
//     required String email,
//     required String password,
//     required String address,
//     required String pincode,
//     required String mobileNumber,
//   }) async {
//     try {
//       final response = await dio.post(
//         'https://api.example.com/register',
//         data: {
//           'name': name,
//           'email': email,
//           'password': password,
//           'address': address,
//           'pincode': pincode,
//           'mobileNumber': mobileNumber,
//         },
//       );

//       return response.statusCode == 200;
//     } catch (e) {
//       throw e;
//     }
//   }

//   Future<bool> login(String email, String password) async {
//     try {
//       final response = await dio.post(
//         'https://api.example.com/login',
//         data: {'email': email, 'password': password},
//       );

//       return response.statusCode == 200;
//     } catch (e) {
//       throw e;
//     }
//   }
// }
