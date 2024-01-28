import 'dart:math';

abstract class Helpers {
  static final random = Random();

  static String randomPictureUrl() {
    final randomInt = random.nextInt(1000);
    return 'https://picsum.photos/seed/$randomInt/300/300';
  }

  static String getTimeDate(DateTime time) {
    final DateTime now = DateTime.now();
    final DateTime yesterday = DateTime(now.year, now.month, now.day - 1);
    final DateTime messageDate = DateTime(time.year, time.month, time.day);
    final Duration difference = now.difference(time);
    if (difference.inDays == 0) {
      return 'Today ${time.hour}:${time.minute.toString().padLeft(2, '0')}';
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else if (messageDate.isBefore(yesterday)) {
      return '${time.day}/${time.month}/${time.year}';
    } else {
      return '${time.hour}:${time.minute}';
    }
  }
}
