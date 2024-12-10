class Event {
  String eventName;
  final DateTime date;
  final double remainPerPerson;
  final int remainPeople;
  Event({
    this.eventName = 'イベント名未設定',
    required this.date,
    required this.remainPerPerson,
    required this.remainPeople,
  });
}
