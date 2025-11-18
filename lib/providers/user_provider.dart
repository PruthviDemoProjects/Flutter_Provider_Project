
import 'package:flutter/material.dart';
import 'package:flutter_provider_project/models/user_model.dart';
import 'package:flutter_provider_project/services/api_service.dart';

class UserProvider with ChangeNotifier{
  final ApiService apiService = ApiService();

  List<UserModel> users = [];
  bool isLoading = false;
  String message = "Click button to load users";

  Future<void> getUsers() async{
    isLoading = true;
    message = "Loading...";
    notifyListeners();

    try{
      users = await apiService.fetchUser();
      message = "Data Loaded Successfully";
    }catch (e){
      message = "Error loading data";
    }
    isLoading = false;
    notifyListeners();
  }
  // Button click → UI change
  void updateMessage() {
    message = "Button Pressed! UI Updated!";
    notifyListeners();
  }
}