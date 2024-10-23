
import 'package:get/get.dart';

class DataGetViewController extends GetxController{
     DateTime selectedDate =  DateTime.now().add(const Duration(days: 2));

     DateTime reselectedDate() {
       return selectedDate = DateTime.now().add(const Duration(days: 2));
     }
}