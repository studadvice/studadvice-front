import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:stud_advice/src/utils/calendar_utils.dart';
import '../../../stud_advice.dart';
import '../../controllers/categories/calendar_controller.dart';
import '../roadmap/roadmap_screen.dart';

class CalendarScreen extends StatelessWidget {
  static const String navigatorId = '/calendar';
  final CalendarController calendarController = Get.find();

  @override
  Widget build(BuildContext context) {
    print(calendarController.administrativeProcessesEvents); //TODO need to use this to rebuild in change, change the logic
    return Scaffold(
      appBar: AppBar(
        title:
            Text('categories.calendar'.tr),
      ),
      body: Obx(() {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                  markerDecoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                    shape: BoxShape.circle,
                  ),
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
                    leftChevronIcon : Icon(
                        Icons.chevron_left,
                        color: AppColors.primaryColor,
                    ),
                    rightChevronIcon : Icon(
                        Icons.chevron_right,
                        color: AppColors.primaryColor,
                    ),
                ),
                onDaySelected: calendarController.onDaySelected,
                onRangeSelected: calendarController.onRangeSelected,
                onFormatChanged: calendarController.onFormatChanged,
                onPageChanged: (focusedDay) {
                  calendarController.focusedDay.value = focusedDay;
                },
                  calendarBuilders: CalendarBuilders(
                    singleMarkerBuilder: (context, date, events) {
                      if (calendarController.getEventsForDay(date).isNotEmpty) {
                        return Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: const BoxDecoration(
                              color: AppColors.red,
                              shape: BoxShape.circle,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '${calendarController.getEventsForDay(date).length}', // Display the number of events
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                ),
                                // Add additional content if needed
                              ],
                            ),
                          ),
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  ),

              ),
            const SizedBox(height: 10.0),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    "calendar.events_title".tr,
                    style: const TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Container(
              child: calendarController.selectedEvents.isEmpty
                    ?
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 4.0,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    border: Border.all(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child : Text(
                      "calendar.events_empty".tr,
                      style: const TextStyle(
                        fontSize: 18.0,
                      )
                    )
                  )
                )
                  : Expanded(
                child : ListView.builder(
                itemCount: calendarController.selectedEvents.length,
                itemBuilder: (context, index) {
                  final event = calendarController.selectedEvents[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 4.0,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.customGrey,
                      border: Border.all(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    child: ListTile(
                      onTap: () {
                        Get.toNamed(
                          RoadMapScreen.navigatorId,
                          arguments: {
                            'administrativeProcessId': event.id,
                          },
                        );
                      },
                      title: Text(event.eventName ?? ""),
                    ),
                  );
                },
              ),
            )
            ),
          ],
        );
      }),
    );
  }
}