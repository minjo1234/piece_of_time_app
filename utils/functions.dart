// date
String getWeekday(int weekDay) {
  const weekdays = ['월', '화', '수', '목', '금', '토', '일'];
  return weekdays[weekDay - 1 % 7];
}

String getDDay(DateTime targetDate) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final target = DateTime(targetDate.year, targetDate.month, targetDate.day);

  final diff = target.difference(today).inDays;

  if (diff == 0) return '오늘';
  return diff > 0 ? 'D - $diff' : 'D + ${-diff}';
}
