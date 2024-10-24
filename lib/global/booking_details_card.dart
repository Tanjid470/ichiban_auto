import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ichiban_auto/backend/car_booking_data_get.dart';
import 'package:ichiban_auto/const/app_color.dart';
import 'package:ichiban_auto/const/dynamic_font.dart';
import 'package:ichiban_auto/global/text_format.dart';


class BookingDetailsCard extends StatefulWidget {
  final int index;
  const BookingDetailsCard({
    super.key,
    required this.index
  });

  @override
  State<BookingDetailsCard> createState() => _BookingDetailsCardState();
}

class _BookingDetailsCardState extends State<BookingDetailsCard> {

  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
          color: AppColors.baseColorRedShade100,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
                color: AppColors.baseColorGreyShade100,
                blurRadius: 1,
                blurStyle: BlurStyle.outer)
          ]),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextFormat(subtitle: 'Assign', title:  CarBookingDataGet.carBookingDataGet[widget.index].assignMechanic.toString()),
                    CustomTextFormat(subtitle: 'Vehicle', title:  "${CarBookingDataGet.carBookingDataGet[widget.index].brand} ${CarBookingDataGet.carBookingDataGet[widget.index].model}"),
                  ],
                ),
              ),
            ],
          ),
          !_isExpanded ?
          InkWell(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded; // Toggle the expanded state
              });
            },
            child:Text("Details", style: TextStyle(color: AppColors.baseColorRed)),
          )
              : Container(
                  height: 1,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  margin: const EdgeInsets.only(top: 10),
                  decoration:BoxDecoration(
                      color: AppColors.baseColorRedShade100
                  ) ,
                ),
          if (_isExpanded) // Conditionally show additional content
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextFormat(subtitle: 'Brand', title: CarBookingDataGet.carBookingDataGet[widget.index].brand.toString()),
                          CustomTextFormat(subtitle: 'Model', title: "${CarBookingDataGet.carBookingDataGet[widget.index].model} ${CarBookingDataGet.carBookingDataGet[widget.index].year}"),
                          CustomTextFormat(subtitle: 'Registration', title: CarBookingDataGet.carBookingDataGet[widget.index].registration.toString()),
                          CustomTextFormat(subtitle: 'Customer Name', title: CarBookingDataGet.carBookingDataGet[widget.index].customerName.toString()),
                          CustomTextFormat(subtitle: 'Customer Contact', title: CarBookingDataGet.carBookingDataGet[widget.index].customerNumber.toString()),
                          CustomTextFormat(subtitle: 'Customer Email', title: CarBookingDataGet.carBookingDataGet[widget.index].customerEmail.toString()),
                          CustomTextFormat(subtitle: 'Booking Title', title: CarBookingDataGet.carBookingDataGet[widget.index].bookingTitle.toString()),
                          CustomTextFormat(subtitle: 'Start', title: CarBookingDataGet.carBookingDataGet[widget.index].startDate.toString()),
                          CustomTextFormat(subtitle: 'End', title: CarBookingDataGet.carBookingDataGet[widget.index].endDate.toString()),
                        ],
                      ),
                    ),
                    _isExpanded ?
                    InkWell(
                      onTap: () {
                        setState(() {
                          _isExpanded = !_isExpanded; // Toggle the expanded state
                        });
                      },
                      child:Text("Minimize", style: TextStyle(color: AppColors.baseColorRed)),
                    ) : const SizedBox()
                  ],
                ) // Replace this with actual details content
            ),
        ],
      ),
    );
  }
}

