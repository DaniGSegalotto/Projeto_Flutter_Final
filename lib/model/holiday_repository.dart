import 'dart:convert';

import 'package:meuapp/core/constants.dart';
import 'package:meuapp/model/holiday_model.dart';
import 'package:http/http.dart' as http;

class HolidayRepository {
  final Uri url = Uri.parse("$urlBaseApiHoliday/holidays");

  Future<List<HolidayEntity>> getAll() async {
    List<HolidayEntity> holidayList = [];

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      for (var holiday in json) {
        holidayList.add(HolidayEntity.fromJson(holiday));
      }
    }
    return holidayList;
  }

    postNewHoliday(HolidayEntity holidayEntity) async {
    final json = jsonEncode(HolidayEntity.toJson(holidayEntity));
    var response = await http.post(url, body: json);
    if (response.statusCode != 201) {
      throw "Problemas ao inserir seus dados";
    }
  }

  deleteHoliday(String id) async {
    final url = '$urlBaseApiHoliday/holidays/$id';
    var response = await http.delete(Uri.parse(url));
    if (response.statusCode != 200) {
      throw 'Problemas ao excluir seus dados';
    }
  }

  putUpdateHoliday(HolidayEntity holidayEntity) async {
    final url = '$urlBaseApi/holidays/${holidayEntity.id}';
    final json = jsonEncode(HolidayEntity.toJson(holidayEntity));
    var response = await http.put(Uri.parse(url), body: json);
    if (response.statusCode != 200) {
      throw 'Problemas ao atualizar seus dados';
    }
  }
}