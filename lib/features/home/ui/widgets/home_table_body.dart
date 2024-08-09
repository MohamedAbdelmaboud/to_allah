import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_allah/core/utils/app_colors.dart';
import 'package:to_allah/core/utils/app_styles.dart';
import 'package:to_allah/features/home/data/cubits/home_cubit.dart';
import 'package:to_allah/features/home/data/models/table_row_info.dart';
import 'package:to_allah/features/home/data/models/user_data_model.dart';
import 'package:to_allah/features/home/ui/widgets/custom_table_cell.dart';
import 'package:to_allah/features/home/ui/widgets/zakr_item.dart';
import 'package:to_allah/features/home/ui/widgets/zakr_table_cell.dart';

class HomeTableBody extends StatelessWidget {
  const HomeTableBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeCubitState>(
      builder: (context, state) {
        final cubit = context.read<HomeCubit>();
        return SizedBox(
          width: double.infinity,
          child: Table(
            textDirection: TextDirection.rtl,
            defaultColumnWidth: const IntrinsicColumnWidth(),
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            border: TableBorder.all(
              color: AppColors.secondaryColor.withOpacity(0.6),
            ),
            children: [
              _buildTableHeader(cubit.usersData),
              _buildMorningAzkar(cubit),
              _buildPrayInMasjid(cubit),
              _buildTakberElehram(cubit),
              _buildSunnah(cubit),
              _buildPrayInNabi(cubit),
              _buildQuranVerse(cubit),
              _buildEveningAzkar(cubit),
              _buildMidnightQiam(cubit),
            ],
          ),
        );
      },
    );
  }

  TableRow _buildTableHeader(List<UserDataModel> users) {
    return TableRow(
      children: [
        const ZakrTableCell(),
        ...users.map(
          (model) => CustomTableCell(username: model.username),
        ),
      ],
    );
  }

  TableRow _buildTableRow({
    required TableRowInfo tableRowInfo,
    required List<String> values,
    required List<Function()> onTaps,
    required int lengthOfUsers,
    required dynamic target,
  }) {
    return TableRow(
      children: [
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: ZakrItem(
            azkarModel: tableRowInfo,
          ),
        ),
        ...List.generate(
          lengthOfUsers,
          (index) => TableCell(
            child: GestureDetector(
              onTap: onTaps[index],
              child: Text(
                values[index] == target.toString()
                    ? '✅'
                    : values[index] == 'false'
                        ? '❌'
                        : values[index],
                style: AppStyles.kufamStyle14,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ],
    );
  }

  TableRow _buildMorningAzkar(HomeCubit cubit) {
    return _buildTableRow(
      target: true,
      tableRowInfo: cubit.getTableMorningAzkarInfo(),
      values: cubit.getTableMorningAzkarValues(),
      onTaps: cubit.getTableMorningAzkarOnTaps(),
      lengthOfUsers: cubit.usersData.length,
    );
  }

  TableRow _buildPrayInMasjid(HomeCubit cubit) {
    return _buildTableRow(
      target: 5,
      tableRowInfo: cubit.getTablePrayInMasjidInfo(),
      values: cubit.getTablePrayInMasjidValues(),
      onTaps: cubit.getTablePrayInMasjidOnTaps(),
      lengthOfUsers: cubit.usersData.length,
    );
  }

  TableRow _buildTakberElehram(HomeCubit cubit) {
    return _buildTableRow(
      target: 5,
      tableRowInfo: cubit.getTableTakberElehramInfo(),
      values: cubit.getTableTakberElehramValues(),
      onTaps: cubit.getTableTakberElehramOnTaps(),
      lengthOfUsers: cubit.usersData.length,
    );
  }

  TableRow _buildSunnah(HomeCubit cubit) {
    return _buildTableRow(
      target: 12,
      tableRowInfo: cubit.getTableSunnahInfo(),
      values: cubit.getTableSunnahValues(),
      onTaps: cubit.getTableSunnahOnTaps(),
      lengthOfUsers: cubit.usersData.length,
    );
  }

  TableRow _buildPrayInNabi(HomeCubit cubit) {
    return _buildTableRow(
      target: true,
      tableRowInfo: cubit.getTablePrayInNabiInfo(),
      values: cubit.getTablePrayInNabiValues(),
      onTaps: cubit.getTablePrayInNabiOnTaps(),
      lengthOfUsers: cubit.usersData.length,
    );
  }

  TableRow _buildQuranVerse(HomeCubit cubit) {
    return _buildTableRow(
      target: true,
      tableRowInfo: cubit.getTableQuranVerseInfo(),
      values: cubit.getTableQuranVerseValues(),
      onTaps: cubit.getTableQuranVerseOnTaps(),
      lengthOfUsers: cubit.usersData.length,
    );
  }

  TableRow _buildEveningAzkar(HomeCubit cubit) {
    return _buildTableRow(
      target: true,
      tableRowInfo: cubit.getTableEveningAzkarInfo(),
      values: cubit.getTableEveningAzkarValues(),
      onTaps: cubit.getTableEveningAzkarOnTaps(),
      lengthOfUsers: cubit.usersData.length,
    );
  }

  TableRow _buildMidnightQiam(HomeCubit cubit) {
    return _buildTableRow(
      target: true,
      tableRowInfo: cubit.getTableMidnightQiamInfo(),
      values: cubit.getTableMidnightQiamValues(),
      onTaps: cubit.getTableMidnightQiamOnTaps(),
      lengthOfUsers: cubit.usersData.length,
    );
  }
}
