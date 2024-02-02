import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tumpuan/styles/style.dart';

class CatatanHaid extends StatefulWidget {
  const CatatanHaid({Key? key}) : super(key: key);

  @override
  State<CatatanHaid> createState() => _CatatanHaidState();
}

class _CatatanHaidState extends State<CatatanHaid> {
  late DateTime _focusedDay = DateTime.now();
  late DateTime _selectedDay = DateTime.now();
  late DateTime _rangeStartDay = DateTime.utc(2024, 2, 12);
  late DateTime _rangeEndDay = DateTime.utc(2024, 2, 18);
  late DateTime _previousFocusedMonth = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(237, 237, 237, 1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: const Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Text(
            'Tumpuan',
            style: TextStyle(
                fontFamily: 'Brodies', color: Color.fromRGBO(251, 111, 146, 1)),
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text('data'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TableCalendar(
                rangeStartDay: _rangeStartDay,
                rangeEndDay: _rangeEndDay,
                rangeSelectionMode: RangeSelectionMode.toggledOn,
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: _focusedDay,
                onPageChanged: (focusedDay) {
                  setState(() {
                    _focusedDay = focusedDay;
                    _handlePageChange();
                  });
                },
                availableCalendarFormats: const {CalendarFormat.month: 'month'},
                calendarStyle: const CalendarStyle(
                  defaultTextStyle: TextStyle(
                    fontFamily: 'Satoshi',
                    fontWeight: FontWeight.bold,
                  ),
                  weekendTextStyle: TextStyle(
                    color: Colors.red,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: Colors.blueAccent,
                    shape: BoxShape.circle,
                  ),
                  rangeHighlightColor:
                      AppColors.pink1, // Ubah warna range seleksi menjadi pink
                  rangeStartDecoration: BoxDecoration(
                    color: AppColors.pink1,
                    shape: BoxShape.circle,
                  ),
                  rangeEndDecoration: BoxDecoration(
                    color: AppColors.pink1,
                    shape: BoxShape.circle,
                  ),
                  withinRangeTextStyle: TextStyle(
                      fontFamily: 'Satoshi',
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  rangeStartTextStyle: TextStyle(
                      fontFamily: 'Satoshi',
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  rangeEndTextStyle: TextStyle(
                      fontFamily: 'Satoshi',
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  todayDecoration: BoxDecoration(
                    color: Colors.blueAccent,
                    shape: BoxShape.circle,
                  ),
                ),
                startingDayOfWeek: StartingDayOfWeek.monday,
                headerStyle: HeaderStyle(
                  titleTextStyle: TextStyle(
                    fontFamily: 'Satoshi',
                    fontWeight: FontWeight.bold,
                  ),
                  titleCentered: true,
                ),
                // rowHeight: 20,
                daysOfWeekStyle: DaysOfWeekStyle(
                  weekdayStyle: TextStyle(
                    fontFamily: 'Satoshi',
                    fontWeight: FontWeight.bold,
                  ),
                  weekendStyle: TextStyle(
                      fontFamily: 'Satoshi',
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                  // decoration: BoxDecoration(
                  //     border: BorderDirectional(
                  //         bottom: BorderSide(color: Colors.black)))
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _handlePageChange() {
    if (_focusedDay.isAfter(_previousFocusedMonth)) {
      _rangeStartDay = _rangeStartDay.add(const Duration(days: 30));
      _rangeEndDay = _rangeEndDay.add(const Duration(days: 30));
    } else if (_focusedDay.isBefore(_previousFocusedMonth)) {
      _rangeStartDay = _rangeStartDay.subtract(const Duration(days: 30));
      _rangeEndDay = _rangeEndDay.subtract(const Duration(days: 30));
    }
    _previousFocusedMonth = _focusedDay;
  }
}
