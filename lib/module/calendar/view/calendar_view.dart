
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:ichiban_auto/const/app_color.dart';
import 'package:ichiban_auto/const/app_text_style.dart';
import 'package:ichiban_auto/const/dynamic_font.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({super.key});
  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _resetSelectedDate();
  }

  void _resetSelectedDate() {
    _selectedDate = DateTime.now().add(const Duration(days: 2));
  }

  int l = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title:  Text('Timeline',
            style: customSize(TextSize.font24(context),AppColors.baseColorRed),
          ),
          centerTitle: true,
          surfaceTintColor: AppColors.baseColorRed,
          leading:  InkWell(
              onTap: () => Get.back(),
              child: Icon(Icons.arrow_back_ios_new_rounded,color: AppColors.baseColorRed,)) ,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: CalendarTimeline(
                  showYears: true,
                  initialDate: _selectedDate,
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 365 * 4)),
                  onDateSelected: (date) => setState(() => _selectedDate = date),
                  leftMargin: 20,
                  monthColor: AppColors.baseColorGrey,
                  dayColor: AppColors.baseColorGrey,
                  dayNameColor: Colors.white,
                  activeDayColor: Colors.white,
                  shrink: false,
                  activeBackgroundDayColor:AppColors.baseColorRed,
                  locale: 'en',
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      SmartDialog.showToast('upcoming');
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Container(
                        padding:const EdgeInsets.symmetric(horizontal: 10,vertical: 5) ,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.baseColorRed
                          ),
                          borderRadius: const BorderRadius.all(Radius.circular(10))
                        ),
                        child: Text(
                            'See all',
                            style: TextStyle(color: AppColors.baseColorRed,fontWeight: FontWeight.w500),
                          ),
                      )
                    ),
                  ),
                  InkWell(
                    onTap: () => setState(() => _resetSelectedDate()),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15,left: 15),
                      child: Container(
                        padding:const EdgeInsets.symmetric(horizontal: 10,vertical: 5) ,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.baseColorRed
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        child: Text(
                            'Today',
                            style: TextStyle(color: AppColors.baseColorRed,fontWeight: FontWeight.w500),
                          ),
                      )
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Center(
                  child: Text(
                    'Selected date is $_selectedDate',
                    style:
                        const TextStyle(color: Color.fromARGB(255, 32, 180, 165)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
