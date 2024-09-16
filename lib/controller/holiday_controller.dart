import 'package:meuapp/model/holiday_model.dart';
import 'package:meuapp/model/holiday_repository.dart';

class HolidayController {
  HolidayRepository repository = HolidayRepository();

  Future<List<HolidayEntity>> getHolidays() async {
    List<HolidayEntity> list = [];
    list = await repository.getAll();
    //poderia aqui filtrar, formatar, regras
    return list;
  }

postNewHoliday(HolidayEntity holidayEntity) async {
    try {
      await repository.postNewHoliday(holidayEntity);
    } catch (e) {
      rethrow;
    }
  }

  deleteHoliday(String id) async {
    try {
      await repository.deleteHoliday(id);
    } catch (e) {
      rethrow;
    }
  }

  putUpdateHoliday(HolidayEntity holidayEntity) async {
    try {
      await repository.putUpdateHoliday(holidayEntity);
    } catch (e) {
      rethrow;
    }
  }
}

