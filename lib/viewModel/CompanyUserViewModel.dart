import 'package:drivado_app/model/AdvancedCompanyModel.dart';
import 'package:drivado_app/model/Company.dart';
import 'package:drivado_app/model/Users.dart';
import 'package:drivado_app/repository/CompanyUsersRepository.dart';
import 'package:flutter/material.dart';

class CompanyUserViewModel with ChangeNotifier {
  final companyUserRepository = CompanyUserRepository();
  bool userLoading = false;
  bool companyLoading = false;
  bool companyScrollLoading = false;

  List<UserModel> userList = [];
  List<UserModel> onScreenUserList = [];
  int currentUserIndex = 0;
  int currentCompanyIndex = 0;

  List<CompanyModel> companyList = [];
  List<AdvancedCompanyModel> onScreenCompanyList = [];

  List<UserModel> companyUsersList = [];

  getUserDetails() async {
    userLoading = true;
    userList = (await companyUserRepository.getUserDetails())!;
    onScreenUserList.addAll(userList.take(10));
    currentUserIndex = 10;
    userLoading = false;
    notifyListeners();
  }

  fetchUserData() {
    notifyListeners();
    Future.delayed(const Duration(seconds: 2), () {
      int transferCount = 5;
      int itemsToTransfer =
          userList.length >= currentUserIndex ? transferCount : userList.length;
      if (currentUserIndex < userList.length) {
        onScreenUserList.addAll(userList.sublist(
            currentUserIndex, currentUserIndex + itemsToTransfer));
        currentUserIndex += itemsToTransfer;
      }
    });
    notifyListeners();
  }

  getCompanyDetails() async {
    companyLoading = true;
    companyList = (await companyUserRepository.getCompanyDetails())!;
    for (int i = 0; i < 10; i++) {
      companyUsersList = userList
          .where((element) => element.companyId == companyList[i].id)
          .toList();
      onScreenCompanyList.add(AdvancedCompanyModel(
          companyModel: companyList[i], userList: companyUsersList));
    }
    currentCompanyIndex = 10;
    companyLoading = false;
    notifyListeners();
  }

  fetchCompanyData() {
    notifyListeners();
    Future.delayed(const Duration(seconds: 2), () {
      int transferCount = 5;
      int itemsToTransfer = companyList.length >= currentCompanyIndex
          ? transferCount
          : companyList.length;
      if (currentCompanyIndex < companyList.length) {
        for (int i = currentCompanyIndex;
            i < currentCompanyIndex + itemsToTransfer;
            i++) {
          companyUsersList = userList
              .where((element) => element.companyId == companyList[i].id)
              .toList();
          onScreenCompanyList.add(AdvancedCompanyModel(
              companyModel: companyList[i], userList: companyUsersList));
        }
        currentCompanyIndex += itemsToTransfer;
      }
    });
    notifyListeners();
  }

  bool companySwitchValue = false;

  void toggleCompanySwitch(bool value) {
    companySwitchValue = value;
    notifyListeners();
  }

  bool userSwitchValue = false;

  void toggleUserSwitch(bool value) {
    userSwitchValue = value;
    notifyListeners();
  }

  int bottomNavIndex = 0;

  void changeBottomNavigationIndex(int index) {
    bottomNavIndex = index;
    notifyListeners();
  }

  bool isTapped = false;

  void handleUserTapped(bool value) {
    isTapped = true;

    Future.delayed(const Duration(milliseconds: 200), () {
      isTapped = false;
    });
  }
}
