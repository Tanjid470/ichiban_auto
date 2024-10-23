import 'dart:developer';
import 'package:gsheets/gsheets.dart';
import 'package:ichiban_auto/module/calendar/model/car_booking_get_model.dart';

import 'google_sheet_init.dart';


class CarBookingDataGet {

  static Worksheet? _carBookingDataGet;

  static List<BookingGetModel> carBookingDataGet = [];

  static Future<bool> initAndFetchData() async {
    try {
      final spreadSheet = await GoogleSheetInit().inti();
      _carBookingDataGet = await _getWorkSheet(spreadSheet, sheetName: 'CarBooking');

      if (_carBookingDataGet != null) {
        final rows = await _carBookingDataGet!.values.allRows();
        final dataRows = rows.skip(1);
        for (var row in dataRows) {
          final bookingData = {
            'brand': row[0],
            'model': row[1],
            'year': row[2],
            'registration': row[3],
            'customerName': row[4],
            'customerNumber': row[5],
            'customerEmail': row[6],
            'bookingTitle': row[7],
            'startDate': row[8],
            'endDate': row[9],
            'assignMechanic': row[10],
          };
          log(bookingData.toString());
          carBookingDataGet.add(BookingGetModel.fromJson(bookingData));
        }
        log("Data fetched successfully. Total bookings: ${dataRows.length}");
      } else {
        log("Teacher worksheet not found.");
      }
      return true;
    } catch (exception) {
      log("Error fetching booking data: $exception");
      return true;
    }
  }


  static Future<Worksheet?> _getWorkSheet(Spreadsheet spreadsheet, {required String sheetName}) async {
    return spreadsheet.worksheetByTitle(sheetName);
  }
}
