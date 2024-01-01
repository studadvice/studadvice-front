import 'dart:collection';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:stud_advice/src/models/models.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:get/get.dart';
import "calendar_utils.dart";

class CalendarController extends GetxController {
  final Dio _dio = Get.find();
  final Rx<DateTime> focusedDay = DateTime.now().obs;
  final Rx<DateTime?> selectedDay = Rx<DateTime?>(null);
  final Rx<DateTime?> rangeStart = Rx<DateTime?>(null);
  final Rx<DateTime?> rangeEnd = Rx<DateTime?>(null);
  final Rx<CalendarFormat> calendarFormat = CalendarFormat.month.obs;
  final Rx<RangeSelectionMode> rangeSelectionMode =
      RangeSelectionMode.toggledOff.obs;
  final RxList<AdministrativeProcessContent> selectedEvents = <AdministrativeProcessContent>[].obs;

  Rx<LinkedHashMap<DateTime, List<AdministrativeProcessContent>>> administrativeProcessesEvents = LinkedHashMap<DateTime, List<AdministrativeProcessContent>>(
    equals: isSameDay,
    hashCode: getHashCode,
  ).obs;

  @override
  void onInit() {
    super.onInit();
    getAdministrativeProcesses();
  }

  Future<void> getAdministrativeProcesses() async {
    try {
      final response = await _dio.get(
        "/administrative-process",
      );

      if (response.statusCode == HttpStatus.ok) {
        final administrativeProcessList = AdministrativeProcesses.fromJson(
            response.data);
        administrativeProcessesEvents.value =
            createLinkedHashMap(administrativeProcessList.content);
      } else {
        throw Exception('Failed to load administrative processes');
      }
    } catch (error) {
      rethrow;
    }
  }

  List<AdministrativeProcessContent> getEventsForDay(DateTime day) {
    return administrativeProcessesEvents.value[day] ?? [];
  }

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(this.selectedDay.value, selectedDay)) {
      this.selectedDay.value = selectedDay;
      this.focusedDay.value = focusedDay;
      rangeStart.value = null;
      rangeEnd.value = null;
      rangeSelectionMode.value = RangeSelectionMode.toggledOff;

      selectedEvents.value = getEventsForDay(selectedDay);
    }
  }

  void onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    selectedDay.value = null;
    this.focusedDay.value = focusedDay;
    rangeStart.value = start;
    rangeEnd.value = end;
    rangeSelectionMode.value = RangeSelectionMode.toggledOn;

    if (start != null && end != null) {
      selectedEvents.value = _getEventsForRange(start, end);
    } else if (start != null) {
      selectedEvents.value = getEventsForDay(start);
    } else if (end != null) {
      selectedEvents.value = getEventsForDay(end);
    }
  }

  List<AdministrativeProcessContent> _getEventsForRange(DateTime start, DateTime end) {
    final days = daysInRange(start, end);

    return [
      for (final d in days) ...getEventsForDay(d),
    ];
  }

  void onFormatChanged(CalendarFormat format) {
    if (calendarFormat.value != format) {
      calendarFormat.value = format;
    }
  }

  LinkedHashMap<DateTime, List<AdministrativeProcessContent>> createLinkedHashMap(List<AdministrativeProcessContent> events) {
    final linkedHashMap = LinkedHashMap<DateTime, List<AdministrativeProcessContent>>(
      equals: isSameDay,
      hashCode: getHashCode,
    );

    for (final event in events) {
      final startDate = DateTime.tryParse(event.startDate ?? '');
      final endDate = DateTime.tryParse(event.endDate ?? '');
      if (startDate != null) {
        event.eventName = "Début de la démarche administrative : ${event.name}" ;
        if (linkedHashMap.containsKey(startDate)) {
          linkedHashMap[startDate]!.add(event);
        } else {
          linkedHashMap[startDate] = [event];
        }
      }

      if (endDate != null) {
        event.eventName = "Fin de la démarche administrative : ${event.name}" ;
        if (linkedHashMap.containsKey(endDate)) {
          linkedHashMap[endDate]!.add(event);
        } else {
          linkedHashMap[endDate] = [event];
        }
      }
    }
    return linkedHashMap;
  }

}
