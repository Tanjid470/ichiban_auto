import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingDataController extends GetxController{
  RxBool buttonEnable =false.obs;

  TextEditingController carMakeController = TextEditingController();
  TextEditingController carModelController = TextEditingController();
  TextEditingController carYearController = TextEditingController();
  TextEditingController registrationPlateController = TextEditingController();
  TextEditingController customerNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController bookingTitleController = TextEditingController();

  submitButtonEnable(){
    buttonEnable.value = carMakeController.text.isNotEmpty &&
        carModelController.text.isNotEmpty &&
        carYearController.text.isNotEmpty &&
        registrationPlateController.text.isNotEmpty &&
        customerNameController.text.isNotEmpty &&
        phoneNumberController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        bookingTitleController.text.isNotEmpty;
  }
  void clearAllControllers() {
    carMakeController.clear();
    carModelController.clear();
    carYearController.clear();
    registrationPlateController.clear();
    customerNameController.clear();
    phoneNumberController.clear();
    emailController.clear();
    bookingTitleController.clear();
  }

  @override
  void onClose() {
    carMakeController.dispose();
    carModelController.dispose();
    carYearController.dispose();
    registrationPlateController.dispose();
    customerNameController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
    bookingTitleController.dispose();
    super.onClose();
  }
}