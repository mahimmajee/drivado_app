import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:drivado_app/model/Company.dart';
import 'package:http/http.dart' as http;
import 'package:drivado_app/model/Users.dart';

class CompanyUserRepository {
  Future<List<UserModel>?> getUserDetails() async {
    List<UserModel> userList = [];
    var response = await http.get(
      Uri.parse("https://673736a9aafa2ef222330e54.mockapi.io/users"),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    ).timeout(
      const Duration(seconds: 600),
      onTimeout: () => throw TimeoutException('Can\'t connect in 600 seconds.'),
    );
    try {
      if (response.statusCode == 200) {
        var perf = json.decode(response.body);
        for (var userData in perf) {
          userList.add(UserModel.fromJson(userData));
        }
        return userList;
      } else {
        print(
            "Get getUserDetails Request Status Code =====> ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Exception during getting getUserDetails Request =========> $e");
      return null;
    }
  }

  Future<List<CompanyModel>?> getCompanyDetails() async {
    List<CompanyModel> comapnyList = [];
    var response = await http.get(
      Uri.parse("https://673736a9aafa2ef222330e54.mockapi.io/company"),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    ).timeout(
      const Duration(seconds: 600),
      onTimeout: () => throw TimeoutException('Can\'t connect in 600 seconds.'),
    );
    try {
      if (response.statusCode == 200) {
        var perf = json.decode(response.body);
        for (var companyData in perf) {
          comapnyList.add(CompanyModel.fromJson(companyData));
        }
        return comapnyList;
      } else {
        print(
            "Get getCompanyDetails Request Status Code =====> ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print(
          "Exception during getting getComapnayDetails Request =========> $e");
      return null;
    }
  }
}
