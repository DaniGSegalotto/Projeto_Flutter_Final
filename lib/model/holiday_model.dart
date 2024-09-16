class HolidayEntity {
  String? id;
  String? date;
  String? name;
  String? type;

  HolidayEntity({this.id, this.date, this.name, this.type});

  static HolidayEntity fromJson(Map<String, dynamic> map) {
    return HolidayEntity(
      id: map['id'],
      date: map['date'],
      name: map['name'],
      type: map['type'],
    );
  }

  static Map<String, dynamic> toJson(HolidayEntity holidayEntity) {
    Map<String, dynamic> json = {
      'date': holidayEntity.date,
      'name': holidayEntity.name,
      'type': holidayEntity.type
    };
    return json;
  }
}
