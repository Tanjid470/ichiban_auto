import 'dart:developer';
import 'package:gsheets/gsheets.dart';
import 'package:ichiban_auto/module/calendar/model/car_booking_get_model.dart';
import 'google_sheet_init.dart';
import 'package:intl/intl.dart';

class CarBookingDataGet {

  static Worksheet? _carBookingDataGet;

  static List<BookingGetModel> carBookingDataGet = [];

  static DateTime dateFromExcel(String excelDate) {
    final epoch = DateTime(1899, 12, 30); // Excel's epoch is 30th Dec 1899
    return epoch.add(Duration(days: int.parse(excelDate)));
  }



  static Future<bool> initAndFetchData() async {
    try {
      final spreadSheet = await GoogleSheetInit().inti();
      _carBookingDataGet = await _getWorkSheet(spreadSheet, sheetName: 'CarBooking');

      if (_carBookingDataGet != null) {
        final rows = await _carBookingDataGet!.values.allRows();
        final dataRows = rows.skip(1);


        final today = DateFormat('yyyy-MM-dd').format(DateTime.now());
        log(today.toString());
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
            'startDate': dateFromExcel(row[8]).toString(),
            'endDate': dateFromExcel(row[9]).toString(),
            'assignMechanic': row[10],
          };
          String endDateTime = dateFromExcel(row[9]).toString();
          final endDate = DateFormat('yyyy-MM-dd').format(DateTime.parse(endDateTime));
          if (endDate == today) {
            carBookingDataGet.add(BookingGetModel.fromJson(bookingData));
          }
          //carBookingDataGet.add(BookingGetModel.fromJson(bookingData));
        }
        log("Data fetched successfully. Total bookings for today: ${carBookingDataGet.length}");
      } else {
        log("CarBooking worksheet not found.");
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
