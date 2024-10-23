
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ichiban_auto/backend/car_booking_data_get.dart';
import 'package:ichiban_auto/const/app_color.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CalenderWiseView extends StatefulWidget {
  const CalenderWiseView({super.key});

  @override
  State<CalenderWiseView> createState() => _CalenderWiseViewState();
}

class _CalenderWiseViewState extends State<CalenderWiseView> {

  final ScrollController scrollController = ScrollController();

  bool isLoading = true;


  @override
  void initState() {
    super.initState();
    fetchStudentData();
  }

  void fetchStudentData() async {
    await CarBookingDataGet.initAndFetchData();
    setState(() {
      isLoading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return  isLoading
        ? Center(
          heightFactor: 10,
          child: LoadingAnimationWidget.hexagonDots(
              color: AppColors.baseColorRed,
              size: Get.height/10
          ),
        )
        : ListView.builder(
            shrinkWrap: true,
            itemCount: CarBookingDataGet.carBookingDataGet.length,
            itemBuilder: (context, index) {
            return Card(child: Text(CarBookingDataGet.carBookingDataGet[index].registration.toString()));
          },);
  }
}
