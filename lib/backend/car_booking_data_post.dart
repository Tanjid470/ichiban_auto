
import 'dart:developer';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:gsheets/gsheets.dart';
import 'package:ichiban_auto/backend/car_booking_model.dart';
import 'google_sheet_init.dart';

class CarBookingDataPost{
  static Worksheet? _carBookingSheet;

  static Future inti() async {
    try {
      final spreadSheet = await GoogleSheetInit().inti();

      if (spreadSheet == null) {
        throw Exception('Spreadsheet initialization failed.');
      }
      _carBookingSheet = await _getWorkSheet(spreadSheet, sheetName: 'CarBooking');
      final firstRow = CarBookingModel.setBookingInfo();

      if (_carBookingSheet != null) {
        await _carBookingSheet!.values.insertRow(1, firstRow);
      } else {
        log("Error: Failed to initialize worksheet.");
      }
    } catch (exception) {
      log("Init error CarBookingDataPost: $exception");
    }
  }



  static Future<bool> insert(List<Map<String,dynamic>> rowList) async{
    if(_carBookingSheet == null){
      SmartDialog.dismiss();
      return false;
    }
    _carBookingSheet!.values.map.appendRows(rowList);
    SmartDialog.dismiss();
    return true;
  }

  static _getWorkSheet(Spreadsheet spreadSheet, {required String sheetName}) async{
    try{
      return await spreadSheet.addWorksheet(sheetName);
    }
    catch (exception){
      return spreadSheet.worksheetByTitle(sheetName);
    }
  }
}