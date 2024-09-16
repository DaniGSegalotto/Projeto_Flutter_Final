import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meuapp/controller/holiday_controller_original.dart';
import 'package:meuapp/view/menu.dart';

class HolidayScreen extends StatefulWidget {
  const HolidayScreen({super.key});

  @override
  State<HolidayScreen> createState() => _HolidayScreenState();
}

class _HolidayScreenState extends State<HolidayScreen> {
  final HolidayController controller = HolidayController();
  late Future<List<dynamic>> futureHolidays;
  final int year = DateTime.now().year;
  int? selectedMonth;

  @override
  void initState() {
    super.initState();
    futureHolidays = controller.getHolidays(year, month: selectedMonth);
  }

  String formatDate(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      final formatter = DateFormat('dd/MM/yyyy');
      return formatter.format(date);
    } catch (e) {
      return dateString;
    }
  }

  void _onMonthChanged(int? newMonth) {
    setState(() {
      selectedMonth = newMonth;
      futureHolidays = controller.getHolidays(year, month: selectedMonth);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuDrawer(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 24, 14, 163),
                Color.fromARGB(255, 46, 20, 230),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: AppBar(
            title: Text(
              "LISTA DE FERIADOS",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0,
                shadows: [
                  Shadow(
                    color: Colors.black54,
                    offset: Offset(1, 1),
                    blurRadius: 4.0,
                  ),
                ],
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.white),
            titleTextStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 8.0),
          Expanded(
            child: FutureBuilder<List<dynamic>>(
              future: futureHolidays,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      "Erro ao carregar feriados: ${snapshot.error}",
                      style: const TextStyle(color: Colors.red),
                    ),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(
                      child: Text("Nenhum feriado encontrado."));
                } else {
                  final holidays = snapshot.data!;
                  return ListView.builder(
                    itemCount: holidays.length,
                    itemBuilder: (context, index) {
                      final holiday = holidays[index];
                      return Card(
                        elevation: 5,
                        margin: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16.0),
                        child: ListTile(
                          leading: const Icon(Icons.calendar_today,
                              color: Color.fromARGB(255, 24, 14, 163)),
                          title: Text(
                            holiday['name'] ?? "Nome não informado",
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          subtitle: Text(
                            formatDate(holiday['date'] ?? "Data não informada"),
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          contentPadding: const EdgeInsets.all(2.0),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
