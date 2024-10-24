import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:ichiban_auto/backend/car_booking_data_post.dart';
import 'package:ichiban_auto/const/app_text_style.dart';
import 'package:ichiban_auto/module/booking/model/car_booking_model.dart';
import 'package:ichiban_auto/config/responsive_scale.dart';
import 'package:ichiban_auto/const/app_color.dart';
import 'package:ichiban_auto/module/booking/controller/booking_data_controller.dart';

import '../../../const/dynamic_font.dart';

class CarServiceForm extends StatefulWidget {
  const CarServiceForm({super.key});

  @override
  CarServiceFormState createState() => CarServiceFormState();
}

class CarServiceFormState extends State<CarServiceForm> {
  final _formKey = GlobalKey<FormState>();

  BookingDataController bookingDataController = Get.put(BookingDataController());
  DateTime? startDateTime, endDateTime;
  List<String> mechanics = ['Mechanic A', 'Mechanic B', 'Mechanic C'];
  String? assignedMechanicController;

  Future<void> _selectDateTime(BuildContext context, bool isStart) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        if (isStart) {
          startDateTime = picked;
          bookingDataController.startDateController.text = picked.toString();
          bookingDataController.submitButtonEnable();
        } else {
          endDateTime = picked;
          bookingDataController.endDateController.text = picked.toString();
          bookingDataController.submitButtonEnable();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Car Servicing Booking',
        style: customSize(TextSize.font20(context),AppColors.baseColorRed),),
        centerTitle: true,
        surfaceTintColor: AppColors.baseColorRed,
        leading:  InkWell(
          onTap: () => Get.back(),
            child: Icon(Icons.arrow_back_ios_new_rounded,color: AppColors.baseColorRed,)) ,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Text("Car Details",
                  style: customStyleTitle(TextSize.font20(context))
              ),
              ResponsiveScale.of(context).verticalGap(context, 1.5),
              TextFormField(
                controller: bookingDataController.carMakeController,
                decoration: const InputDecoration(
                  labelText: 'Brand',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  bookingDataController.submitButtonEnable();
                  setState(() {});
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Model',
                  border: OutlineInputBorder(),
                ),
                controller: bookingDataController.carModelController,
                onChanged: (value) {
                  bookingDataController.submitButtonEnable();
                  setState(() {});
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Year',
                  border: OutlineInputBorder(),
                ),
                controller: bookingDataController.carYearController,
                onChanged: (value) {
                  bookingDataController.submitButtonEnable();
                  setState(() {});
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Registration Plate',
                  border: OutlineInputBorder(),
                ),
                controller: bookingDataController.registrationPlateController,
                onChanged: (value) {
                  bookingDataController.submitButtonEnable();
                  setState(() {});
                },
              ),
              const SizedBox(height: 16),

              // Customer Details Section
              Text("Customer Details",  style: customStyleTitle(TextSize.font20(context))),
              ResponsiveScale.of(context).verticalGap(context, 1.5),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Customer name',
                  border: OutlineInputBorder(),
                ),
                controller: bookingDataController.customerNameController,
                onChanged: (value) {
                  bookingDataController.submitButtonEnable();
                  setState(() {});
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Contact number',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
                maxLength: 11,
                controller: bookingDataController.phoneNumberController,
                onChanged: (value) {
                  bookingDataController.submitButtonEnable();
                  setState(() {});
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                controller: bookingDataController.emailController,
                onChanged: (value) {
                  bookingDataController.submitButtonEnable();
                  setState(() {});
                },
              ),


              // Booking Details Section
              const SizedBox(height: 10),
              Text("Booking Details",  style: customStyleTitle(TextSize.font20(context))),
              ResponsiveScale.of(context).verticalGap(context, 1.5),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Booking Title',
                  border: OutlineInputBorder(),
                ),
                controller: bookingDataController.bookingTitleController,
                onChanged: (value) {
                  bookingDataController.submitButtonEnable();
                  setState(() {});
                },
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.baseColorGrey),
                  borderRadius: BorderRadius.circular(5), // Apply border radius here
                ),
                child: ListTile(
                  title: Text(startDateTime == null
                      ? 'Select Start DateTime'
                      : 'Start: ${bookingDataController.startDateController.text}'),
                  trailing: const Icon(Icons.calendar_today),
                  onTap: () => _selectDateTime(context, true),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.baseColorGrey),
                  borderRadius: BorderRadius.circular(5), // Apply border radius here
                ),
                child: ListTile(
                  title: Text(
                    endDateTime == null
                        ? 'Select End DateTime'
                        : 'End: ${bookingDataController.startDateController.text}',
                  ),
                  trailing: const Icon(Icons.calendar_month_sharp),
                  onTap: () => _selectDateTime(context, false),
                ),
              ),

              const SizedBox(height: 16),

              // Mechanic Assignment Section
              Text("Assign Mechanic", style: customStyleTitle(TextSize.font20(context))),
              ResponsiveScale.of(context).verticalGap(context, 1.5),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Assign Mechanic',
                  border: OutlineInputBorder(),
                ),
                items: mechanics.map((String mechanic) {
                  return DropdownMenuItem<String>(
                    value: mechanic,
                    child: Text(mechanic),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    assignedMechanicController =  value;
                  });
                },
              ),
              const SizedBox(height: 100),


            ],
          ),
        ),
      ),
      floatingActionButton: SafeArea(child: submitButton(context)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget submitButton(BuildContext context) {
    return bookingDataController.buttonEnable.value
        ? InkWell(
              onTap: () async {
                SmartDialog.showLoading();
                await CarBookingDataPost.inti();
                final carBookingDataMap = {
                  CarBookingModel.brand : bookingDataController.carMakeController.text,
                  CarBookingModel.model : bookingDataController.carModelController.text,
                  CarBookingModel.year : bookingDataController.carYearController.text,
                  CarBookingModel.registration : bookingDataController.registrationPlateController.text,
                  CarBookingModel.customerName : bookingDataController.customerNameController.text,
                  CarBookingModel.customerNumber : bookingDataController.phoneNumberController.text,
                  CarBookingModel.customerEmail : bookingDataController.emailController.text,
                  CarBookingModel.bookingTitle : bookingDataController.bookingTitleController.text,
                  CarBookingModel.startDate : startDateTime.toString(),
                  CarBookingModel.endDate : endDateTime.toString(),
                  CarBookingModel.assignMechanic : assignedMechanicController.toString(),
                };
                await CarBookingDataPost.insert([carBookingDataMap]);
                bookingDataController.clearAllControllers();
                bookingDataController.submitButtonEnable();
                setState(() {
                });
              },
              child: Container(
                height: 45,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.symmetric(vertical: 2),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    colors: [
                      AppColors.baseColorRed,
                      AppColors.baseColorRed,
                    ], // Replace with your desired gradient colors
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.baseColorGrey,
                      offset: const Offset(2, 2)
                    )
                  ]
                ),
                child: Text('Submit',
                  style: TextStyle(color: Colors.white,
                    fontSize: TextSize.font22(context),
                    fontWeight: FontWeight.w800
                  ),
                ),
              ),
          )
        : InkWell(
            onTap: () async {
              SmartDialog.showToast('Fill al required data');
            },
            child: Container(
              height: 45,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.symmetric(vertical: 2),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.baseColorGrey,
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.baseColorGrey,
                        offset: const Offset(2, 2)
                    )
                  ]
              ),
              child: Text('Submit',
                style: TextStyle(color: Colors.white,
                    fontSize: TextSize.font22(context),
                    fontWeight: FontWeight.w800
                ),
              ),
            ),
          );
  }
}
