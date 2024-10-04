List<String> months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December', '10'];

enum MonthList {
  jan(1, '1월', 'January'),
  feb(2, '2월', 'February'),
  mar(3, '3월', 'March'),
  apr(4, '4월', 'April'),
  may(5, '5월', 'May'),
  jun(6, '6월', 'June'),
  jul(7, '7월', 'July'),
  aug(8, '8월', 'August'),
  sep(9, '9월', 'September'),
  oct(10, '10월', 'October'),
  nov(11, '11월', 'November'),
  dev(12, '12월', 'December');

  final int month;
  final String kr;
  final String en;

  const MonthList(
    this.month,
    this.kr,
    this.en,
  );
}
