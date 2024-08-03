import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:to_allah/core/utils/app_images.dart';
import 'package:to_allah/core/utils/app_styles.dart';
import 'package:to_allah/features/home/data/models/azkar_model.dart';

import '../../../../core/utils/app_colors.dart';
import '../../data/models/user_model.dart';
import 'widgets/custom_table_cell.dart';
import 'widgets/table_logo.dart';
import 'widgets/zakr_item.dart';
import 'widgets/zakr_table_cell.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  List<UserModel> get users {
    return [
      UserModel(name: 'عبده'),
      UserModel(name: 'رشد'),
    ];
  }

  List<AzkarModel> get azkarList {
    return [
      AzkarModel(
        title: 'اذكار الصباح',
        imagePath: Assets.assetsImagesAzkar,
      ),
      AzkarModel(
        title: 'الصلاه في المسجد',
        imagePath: Assets.assetsImagesPrayer,
      ),
      AzkarModel(
        title: 'الصلاه من اول ركعه',
        imagePath: Assets.assetsImagesPrayer,
      ),
      AzkarModel(
        title: 'السنن المؤكده',
        imagePath: Assets.assetsImagesPrayer,
      ),
      AzkarModel(
        title: 'الصلاه علي النبي',
        imagePath: Assets.assetsImagesBeads,
      ),
      AzkarModel(
        title: 'ورد القران',
        imagePath: Assets.assetsImagesLogo,
      ),
      AzkarModel(
        title: 'اذكار المساء',
        imagePath: Assets.assetsImagesAzkar,
      ),
      AzkarModel(
        title: 'قيام الليل',
        imagePath: Assets.assetsImagesNight,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const TableLogo(),
          const Gap(10),
          SizedBox(
            width: double.infinity,
            child: Table(
                textDirection: TextDirection.rtl,
                defaultColumnWidth: const IntrinsicColumnWidth(),
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                border: TableBorder.all(
                  color: AppColors.secondaryColor.withOpacity(0.6),
                ),
                children: [
                  buildTableHeader(),
                  ...azkarList.map(
                    (zakr) => TableRow(
                      children: [
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: ZakrItem(
                            azkarModel: zakr,
                          ),
                        ),
                        ...users.map(
                          (model) => const TableCell(
                            child: Text(
                              '',
                              style: AppStyles.kufamStyle14,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
        ],
      ),
    );
  }

  TableRow buildTableHeader() {
    return TableRow(
      children: [
        const ZakrTableCell(),
        ...users.map(
          (model) => CustomTableCell(userModel: model),
        ),
      ],
    );
  }

  // i used dataTable but was not able to make it work well

  // columns: [
  //   ...users.map(
  //     (model) => buildDataColumn(model.name),
  //   ),
  //   buildDataColumn('الذكر'),
  // ],
  // rows: azkarList
  //     .map(
  //       (zakr) => buildZakrRow(zakr),
  //     )
  //     .toList(),

  // DataRow buildZakrRow(AzkarModel azkarModel) {
  //   return DataRow(cells: [
  //     const DataCell(Text('Mohamed')),
  //     const DataCell(Text('25')),
  //     buildZakrItem(azkarModel),
  //   ]);
  // }

  // DataCell buildZakrItem(AzkarModel azkarModel) => DataCell(
  //       ZakrItem(
  //         azkarModel: azkarModel,
  //       ),
  //     );

  // DataColumn buildDataColumn(String name) {
  //   return DataColumn(
  //     label: Text(
  //       name,
  //       textDirection: TextDirection.rtl,
  //       style: AppStyles.kufamStyle14,
  //       textAlign: TextAlign.center,
  //     ),
  //   );
  // }
}
