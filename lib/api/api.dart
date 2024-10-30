import "package:dio/dio.dart";


Dio api = Dio(
  
  BaseOptions(
    baseUrl: 'http://127.0.0.1:3000',
    // headers: {
    //   "content-type": "application/json",
    //   "accept": "application/json"
    // },
  )
);
// http://localhost:3000/restaurants