class AgeInfo {
  final DateTime dob;
  final List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  final List<String> daysOfWeek = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];

  AgeInfo(this.dob);

  String get seconds {
    DateTime currentTime = DateTime.now();
    return currentTime.difference(dob).inSeconds.toString();
  }

  String get minutes {
    DateTime currentTime = DateTime.now();
    return currentTime.difference(dob).inMinutes.toString();
  }

  String get hours {
    DateTime currentTime = DateTime.now();
    return currentTime.difference(dob).inHours.toString();
  }

  String get days {
    DateTime currentTime = DateTime.now();
    return currentTime.difference(dob).inDays.toString();
  }

  String get weeks {
    num totalWeeks = (num.parse(this.days) / 7).floor();
    // num remainingDays = (num.parse(this.days) % 7);

    return totalWeeks.toString();
  }

  String get years {
    num totalYears = (num.parse(this.days) / 365);

    return totalYears.toStringAsFixed(2);
  }

  String timeTil(int year) {
    DateTime date = DateTime(year);
    return dob.difference(date).inDays.toString();
  }

  String _getSuffix(int day) {
    int i = day % 10;
    if (i == 1 && day != 11) {
      return 'st';
    } else if (i == 2 && day != 12) {
      return 'nd';
    } else if (i == 3 && day != 13) {
      return 'rd';
    } else {
      return 'th';
    }
  }

  @override
  String toString() {
    return daysOfWeek.elementAt(dob.weekday - 1).toString() +
        ", " +
        dob.day.toString() +
        _getSuffix(dob.day) +
        " " +
        months.elementAt(dob.month - 1) +
        " " +
        dob.year.toString();
  }
}
