import 'package:flutter/material.dart';

class DataSheetScreen extends StatelessWidget {
  final String title;
  final String sheetName;

  const DataSheetScreen({
    super.key,
    required this.title,
    required this.sheetName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.download),
            onPressed: () {},
            tooltip: 'Экспорт',
          ),
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {},
            tooltip: 'Фильтры',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Text(
                      'Данные раздела: $sheetName',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 250,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Поиск по таблице...',
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Theme.of(context).colorScheme.surfaceContainerHighest.withOpacity(0.3),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),
              Expanded(
                child: _buildDataTable(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDataTable(BuildContext context) {
    // This is a generic table. We will replace columns and rows once the user provides the actual table data.
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        child: DataTable(
          headingTextStyle: const TextStyle(fontWeight: FontWeight.bold),
          columns: const [
            DataColumn(label: Text('Артикул')),
            DataColumn(label: Text('Наименование')),
            DataColumn(label: Text('Категория')),
            DataColumn(label: Text('Остаток', textAlign: TextAlign.right)),
            DataColumn(label: Text('Цена', textAlign: TextAlign.right)),
            DataColumn(label: Text('Статус')),
          ],
          rows: List.generate(
            15,
            (index) => DataRow(
              cells: [
                DataCell(Text('SKU-${1000 + index}')),
                DataCell(Text('Товар для маркетплейса #${index + 1}')),
                const DataCell(Text('Электроника')),
                DataCell(Text('${(25 - index) * 12}')),
                DataCell(Text('${1500 + (index * 250)} ₽')),
                DataCell(
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: index % 4 == 0 ? Colors.red.withOpacity(0.1) : Colors.green.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      index % 4 == 0 ? 'Мало на складе' : 'В наличии',
                      style: TextStyle(
                        color: index % 4 == 0 ? Colors.red : Colors.green,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}