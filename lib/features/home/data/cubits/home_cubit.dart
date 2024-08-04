import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_allah/core/helpers/print.dart';
import 'package:to_allah/features/home/data/models/table_data_model.dart';
import 'package:to_allah/features/home/data/models/user_data_model.dart';

import '../../../../core/services/firestore_services.dart';
import '../../../../core/utils/app_images.dart';
import '../../../login/local_data/local_data.dart';
import '../models/table_row_info.dart';

part 'home_cubit_state.dart';

class HomeCubit extends Cubit<HomeCubitState> {
  HomeCubit() : super(HomeInitialState());

  late String username;
  late List<UserDataModel> usersData;
  int dayIndex = 0;

  void _initUsername() {
    emit(HomeLoadingState());
    username = LocalData.getUsername()!;
    emit(HomeSuccessState());
  }

  Future<void> _initUsersData() async {
    emit(HomeLoadingState());
    final result = await FirestoreServices.getUsersData();
    result.fold(
      (failure) => emit(HomeErrorState(failure.message)),
      (usersData) {
        this.usersData = usersData;
        emit(HomeSuccessState());
      },
    );
  }

  void init() async {
    emit(HomeLoadingState());
    _initUsername();
    await _initUsersData();
    usersData[0].data.add(TableDataModel.initial());
    usersData[1].data.add(TableDataModel.initial());
    Print.info('users data len: ${usersData.length}');
    Print.info('user1 : ${usersData[0].data.length}');
    Print.info('user2: ${usersData[1].data.length}');
    emit(HomeSuccessState());
  }

  // ** Edit data functions **
  void toggleMorningAzkar({required int userIndex}) {
    if (!_isAllowToEdit(userIndex: userIndex)) return;
    usersData[userIndex].data[dayIndex].toggleMorningAzkar();
    emit(HomeSuccessState());
  }

  void incrementPrayInMasjid({required int userIndex}) {
    if (!_isAllowToEdit(userIndex: userIndex)) return;
    usersData[userIndex].data[dayIndex].incrementPrayInMasjid();
    emit(HomeSuccessState());
  }

  void incrementTakberElehram({required int userIndex}) {
    if (!_isAllowToEdit(userIndex: userIndex)) return;
    usersData[userIndex].data[dayIndex].incrementTakberElehram();
    emit(HomeSuccessState());
  }

  void incrementSunnah({required int userIndex}) {
    if (!_isAllowToEdit(userIndex: userIndex)) return;
    usersData[userIndex].data[dayIndex].incrementSunnah();
    emit(HomeSuccessState());
  }

  void togglePrayInNabi({required int userIndex}) {
    if (!_isAllowToEdit(userIndex: userIndex)) return;
    usersData[userIndex].data[dayIndex].togglePrayInNabi();
    emit(HomeSuccessState());
  }

  void toggleQuranVerse({required int userIndex}) {
    if (!_isAllowToEdit(userIndex: userIndex)) return;
    usersData[userIndex].data[dayIndex].toggleQuranVerse();
    emit(HomeSuccessState());
  }

  void toggleMidnightQiam({required int userIndex}) {
    if (!_isAllowToEdit(userIndex: userIndex)) return;
    usersData[userIndex].data[dayIndex].toggleMidnightQiam();
    emit(HomeSuccessState());
  }

  void toggleEveningAzkar({required int userIndex}) {
    if (!_isAllowToEdit(userIndex: userIndex)) return;
    usersData[userIndex].data[dayIndex].toggleEveningAzkar();
    emit(HomeSuccessState());
  }

  // ** Table Row Info **
  TableRowInfo getTableMorningAzkarInfo() {
    return TableRowInfo(
      title: 'اذكار الصباح',
      imagePath: Assets.assetsImagesAzkar,
    );
  }

  TableRowInfo getTablePrayInMasjidInfo() {
    return TableRowInfo(
      title: 'الصلاه في المسجد',
      imagePath: Assets.assetsImagesPrayer,
    );
  }

  TableRowInfo getTableTakberElehramInfo() {
    return TableRowInfo(
      title: 'ادراك تكبيره الاحرام',
      imagePath: Assets.assetsImagesPrayer,
    );
  }

  TableRowInfo getTableSunnahInfo() {
    return TableRowInfo(
      title: 'السنن المؤكده',
      imagePath: Assets.assetsImagesPrayer,
    );
  }

  TableRowInfo getTablePrayInNabiInfo() {
    return TableRowInfo(
      title: 'الصلاه علي النبي',
      imagePath: Assets.assetsImagesBeads,
    );
  }

  TableRowInfo getTableQuranVerseInfo() {
    return TableRowInfo(
      title: 'ورد القران',
      imagePath: Assets.assetsImagesLogo,
    );
  }

  TableRowInfo getTableEveningAzkarInfo() {
    return TableRowInfo(
      title: 'اذكار المساء',
      imagePath: Assets.assetsImagesAzkar,
    );
  }

  TableRowInfo getTableMidnightQiamInfo() {
    return TableRowInfo(
      title: 'قيام الليل',
      imagePath: Assets.assetsImagesNight,
    );
  }

  // ** Table Values **
  List<String> getTableMorningAzkarValues() {
    return List.generate(
      usersData.length,
      (index) => usersData[index].data[dayIndex].morningAzkar.toString(),
    );
  }

  List<String> getTablePrayInMasjidValues() {
    return List.generate(
      usersData.length,
      (index) => usersData[index].data[dayIndex].prayInMasjid.toString(),
    );
  }

  List<String> getTableTakberElehramValues() {
    return List.generate(
      usersData.length,
      (index) => usersData[index].data[dayIndex].takberElehram.toString(),
    );
  }

  List<String> getTableSunnahValues() {
    return List.generate(
      usersData.length,
      (index) => usersData[index].data[dayIndex].sunnah.toString(),
    );
  }

  List<String> getTablePrayInNabiValues() {
    return List.generate(
      usersData.length,
      (index) => usersData[index].data[dayIndex].prayInNabi.toString(),
    );
  }

  List<String> getTableQuranVerseValues() {
    return List.generate(
      usersData.length,
      (index) => usersData[index].data[dayIndex].quranVerse.toString(),
    );
  }

  List<String> getTableEveningAzkarValues() {
    return List.generate(
      usersData.length,
      (index) => usersData[index].data[dayIndex].eveningAzkar.toString(),
    );
  }

  List<String> getTableMidnightQiamValues() {
    return List.generate(
      usersData.length,
      (index) => usersData[index].data[dayIndex].midnightQiam.toString(),
    );
  }

  // ** Table On Taps **
  List<Function()> getTableMorningAzkarOnTaps() {
    return List.generate(
      usersData.length,
      (index) => () => toggleMorningAzkar(userIndex: index),
    );
  }

  List<Function()> getTablePrayInMasjidOnTaps() {
    return List.generate(
      usersData.length,
      (index) => () => incrementPrayInMasjid(userIndex: index),
    );
  }

  List<Function()> getTableTakberElehramOnTaps() {
    return List.generate(
      usersData.length,
      (index) => () => incrementTakberElehram(userIndex: index),
    );
  }

  List<Function()> getTableSunnahOnTaps() {
    return List.generate(
      usersData.length,
      (index) => () => incrementSunnah(userIndex: index),
    );
  }

  List<Function()> getTablePrayInNabiOnTaps() {
    return List.generate(
      usersData.length,
      (index) => () => togglePrayInNabi(userIndex: index),
    );
  }

  List<Function()> getTableQuranVerseOnTaps() {
    return List.generate(
      usersData.length,
      (index) => () => toggleQuranVerse(userIndex: index),
    );
  }

  List<Function()> getTableEveningAzkarOnTaps() {
    return List.generate(
      usersData.length,
      (index) => () => toggleEveningAzkar(userIndex: index),
    );
  }

  List<Function()> getTableMidnightQiamOnTaps() {
    return List.generate(
      usersData.length,
      (index) => () => toggleMidnightQiam(userIndex: index),
    );
  }

  bool _isAllowToEdit({required int userIndex}) {
    return username == usersData[userIndex].username;
  }
}
