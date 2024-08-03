import 'package:flutter/material.dart';
import 'package:to_allah/core/utils/app_styles.dart';

import '../../../../core/utils/app_colors.dart';
import '../../data/models/user_model.dart';
import 'widgets/table_logo.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  List<UserModel> get users {
    return [
      UserModel(name: 'عبده'),
      UserModel(name: 'رشد'),
    ];
  }

  List<String> get azkar {
    return [
      'اذكار الصباح',
      'الصلاه في المسجد',
      'الصلاه من اول ركعه',
      'السنن المؤكده',
      'الصلاه علي النبي',
      'ورد القران',
      'اذكار المساء',
      'قيام الليل',
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const TableLogo(),
          DataTable(
          dividerThickness: 0.8,
            border: TableBorder.all(
              color: AppColors.secondaryColor.withOpacity(0.6),
            ),
            columns: [
              ...users.map(
                (model) => buildDataColumn(model.name),
              ),
              buildDataColumn('الذكر'),
            ],
            rows: azkar
                .map(
                  (zakr) => buildZakrRow(zakr),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  DataRow buildZakrRow(String zakrTitle) {
    return DataRow(cells: [
      const DataCell(Text('Mohamed')),
      const DataCell(Text('25')),
      buildZakrTitle(zakrTitle),
    ]);
  }

  DataCell buildZakrTitle(String zakrTitle) => DataCell(Text(
        zakrTitle,
        style: AppStyles.kufamStyle12,
      ));

  DataColumn buildDataColumn(String name) {
    return DataColumn(
      label: Text(
        name,
        style: AppStyles.kufamStyle14,
      ),
    );
  }
}
