import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:stud_advice/src/utils/calendar_utils.dart';
import '../../../stud_advice.dart';
import '../../controllers/categories/calendar_controller.dart';

class CalendarScreen extends StatelessWidget {
  static const String navigatorId = '/calendar';
  final CalendarController calendarController = Get.find();

  @override
  Widget build(BuildContext context) {
    print(calendarController.administrativeProcessesEvents); //TODO need to use this to rebuild in change, change the logic
    return Scaffold(
      appBar: AppBar(
        title: //Row(
          //mainAxisAlignment: MainAxisAlignment.center,
          //children: [
            Text('categories.calendar'.tr),
            // IconButton(
            //   icon: const Icon(Icons.info_outline),
            //   onPressed: () {
            //     showDialog(
            //       context: context,
            //       builder: (BuildContext context) {
            //         return Column(
            //           children: [
            //             Stack(
            //               children: [
            //                 Container(
            //                   padding: const EdgeInsets.all(16.0),
            //                   decoration: BoxDecoration(
            //                     color: Colors.white,
            //                     borderRadius: BorderRadius.circular(12.0),
            //                   ),
            //                   child: Text(
            //                     "calendar.description".tr,
            //                     style: const TextStyle(
            //                       fontSize: 18.0,
            //                       color: Colors.black,
            //                       fontWeight: FontWeight.normal,
            //                       decoration: TextDecoration.none,
            //                     ),
            //                   ),
            //                 ),
            //                 Positioned(
            //                   top: 2.0,
            //                   right: 8.0,
            //                   child: IconButton(
            //                     icon: const Icon(Icons.close),
            //                     onPressed: () {
            //                       Navigator.of(context).pop();
            //                     },
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ],
            //         );
            //       },
            //     );
            //   },
            // ),
          //],
        //),
      ),
      body: Obx(() {
        return Column(
          children: [
              TableCalendar<AdministrativeProcessContent>(
                firstDay: kFirstDay,
                lastDay: kLastDay,
                focusedDay: calendarController.focusedDay.value,
                selectedDayPredicate: (day) =>
                    isSameDay(calendarController.selectedDay.value, day),
                rangeStartDay: calendarController.rangeStart.value,
                rangeEndDay: calendarController.rangeEnd.value,
                calendarFormat: calendarController.calendarFormat.value,
                rangeSelectionMode:
                calendarController.rangeSelectionMode.value,
                eventLoader: calendarController.getEventsForDay,
                startingDayOfWeek: StartingDayOfWeek.monday,
                calendarStyle: const CalendarStyle(
                  outsideDaysVisible: false,
                  todayDecoration: BoxDecoration(
                    color: AppColors.grey,
                    shape: BoxShape.circle,
                  ),
                  selectedDecoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  shape: BoxShape.circle,
                  )
                ),
                headerStyle: const HeaderStyle(
                    formatButtonVisible: true,
                    formatButtonShowsNext: false,
                    formatButtonTextStyle: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 13.0,
                    ),
                ),
                onDaySelected: calendarController.onDaySelected,
                onRangeSelected: calendarController.onRangeSelected,
                onFormatChanged: calendarController.onFormatChanged,
                onPageChanged: (focusedDay) {
                  calendarController.focusedDay.value = focusedDay;
                },
              ),
              const SizedBox(height: 8.0),
              Expanded(
                child: ListView.builder(
                  itemCount: calendarController.selectedEvents.length,
                  itemBuilder: (context, index) {
                    final event = calendarController.selectedEvents[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 4.0,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: ListTile(
                        onTap: () {
                          // Redirect to the roadmap of the process;
                        },
                        title: Text(event.eventName ?? ""),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }
      ),
    );
  }
}
