
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ichiban_auto/backend/car_booking_data_get.dart';
import 'package:ichiban_auto/const/app_color.dart';
import 'package:ichiban_auto/const/app_text_style.dart';
import 'package:ichiban_auto/const/dynamic_font.dart';
import 'package:ichiban_auto/global/booking_details_card.dart';
import 'package:ichiban_auto/module/calendar/controller/data_get_view_controller.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CalenderWiseView extends StatefulWidget {
  const CalenderWiseView({super.key});

  @override
  State<CalenderWiseView> createState() => _CalenderWiseViewState();
}

class _CalenderWiseViewState extends State<CalenderWiseView> {
  DataGetViewController dataGetViewController = Get.put(DataGetViewController());

  @override
  void initState() {
    super.initState();
    fetchStudentData();
  }

  void fetchStudentData() async {
    await CarBookingDataGet().initAndFetchData(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => dataGetViewController.isLoading.value
        ? Center(
          heightFactor: 10,
          child: LoadingAnimationWidget.hexagonDots(
              color: AppColors.baseColorRed, size: Get.height / 10),
        )
        : CarBookingDataGet.carBookingDataGet.isNotEmpty
          ? ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(vertical: 5),
            itemCount: CarBookingDataGet.carBookingDataGet.length,
            itemBuilder: (context, index) {
              return BookingDetailsCard(index: index,);
            },
          )
          : Center(
            child: Text("No deadline for this day",
            style: customSize(TextSize.font22(context), AppColors.baseColorGrey)
            ),
          )
    );
  }
}

