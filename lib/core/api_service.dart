import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String _baseUrl = 'https://brasilapi.com.br/api/feriados/v1/';

  Future<List<dynamic>> fetchHolidays(int year) async {
    final String url = '$_baseUrl$year';
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data;
      } else {
        final Map<String, dynamic> errorData = json.decode(response.body);
        final String errorMessage = errorData['message'] ?? 'Erro desconhecido';
        throw Exception('Erro ao carregar feriados: $errorMessage');
      }
    } catch (e) {
      print('Erro: $e');
      throw Exception('Erro ao carregar feriados: $e');
    }
  }
}
