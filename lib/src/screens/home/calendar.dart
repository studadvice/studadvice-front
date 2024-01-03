import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/src/models/models.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:stud_advice/src/utils/calendar_utils.dart';
import '../../../stud_advice.dart';
import '../../controllers/categories/calendar_controller.dart';

class CalendarScreen extends StatelessWidget {
  static const String navigatorId = '/calendar';
  final CalendarController calendarController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('categories.calendar'.tr),
      ),
      body: Obx(() {
        if (calendarController.administrativeProcessesEvents.value.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
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
      }),
    );
  }
}
