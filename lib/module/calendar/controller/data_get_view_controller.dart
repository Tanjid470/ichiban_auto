
import 'package:get/get.dart';

class DataGetViewController extends GetxController{
     DateTime selectedDate =  DateTime.now();

     DateTime reselectedDate() {
       return selectedDate = DateTime.now();
     }
}