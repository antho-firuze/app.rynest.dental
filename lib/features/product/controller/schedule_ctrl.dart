enum TimeIndex {
  time0(0, 8, 'Pagi'),
  time1(1, 10, 'Pagi'),
  time2(2, 13, 'Siang'),
  time3(3, 15, 'Sore'),
  time4(4, 18, 'Sore'),
  time5(5, 20, 'Malam'),
  time6(6, 22, 'Malam'),
  time7(7, 00, 'Malam'),
  ;

  const TimeIndex(this.id, this.time, this.desc);
  final int id;
  final int time;
  final String desc;
}
