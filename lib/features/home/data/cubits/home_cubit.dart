import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_allah/features/home/data/models/user_data_model.dart';
import 'package:to_allah/features/login/models/user_auth.dart';

import '../../../../core/services/firestore_services.dart';
import '../../../../core/utils/app_images.dart';
import '../../../login/local_data/local_data.dart';
import '../models/day_model.dart';
import '../models/table_data_model.dart';
import '../models/table_row_info.dart';

part 'home_cubit_state.dart';

class HomeCubit extends Cubit<HomeCubitState> {
  HomeCubit() : super(HomeInitialState());

  int dayIndex = 0;
  late final String username;
  late final List<UserAuth> usersAuth;
  late final List<UserDataModel> usersData;

  void init() async {
    emit(HomeLoadingState());
    _initUsername();
    await _initUsersData();
    await _initUsersAuth();
    _sortUsersByUsername();
    _initializeFirebaseDays();
    emit(HomeSuccessState());
  }

  void updateDayIndex(int dayIndex) {
    this.dayIndex = dayIndex;
    emit(HomeSuccessState());
  }

  // ** Edit data functions **
  Future<void> toggleMorningAzkar({required int userIndex}) async {
    if (!_isAllowToEdit(userIndex: userIndex)) return;
    usersData[userIndex].data[dayIndex].toggleMorningAzkar();
    await FirestoreServices.updateTableData(
      username: username,
      tableData: usersData[userIndex].data[dayIndex],
    );
    emit(HomeSuccessState());
  }

  Future<void> incrementPrayInMasjid({required int userIndex}) async {
    if (!_isAllowToEdit(userIndex: userIndex)) return;
    usersData[userIndex].data[dayIndex].incrementPrayInMasjid();
    await FirestoreServices.updateTableData(
      username: username,
      tableData: usersData[userIndex].data[dayIndex],
    );
    emit(HomeSuccessState());
  }

  Future<void> incrementTakberElehram({required int userIndex}) async {
    if (!_isAllowToEdit(userIndex: userIndex)) return;
    usersData[userIndex].data[dayIndex].incrementTakberElehram();
    await FirestoreServices.updateTableData(
      username: username,
      tableData: usersData[userIndex].data[dayIndex],
    );
    emit(HomeSuccessState());
  }

  Future<void> incrementSunnah({required int userIndex}) async {
    if (!_isAllowToEdit(userIndex: userIndex)) return;
    usersData[userIndex].data[dayIndex].incrementSunnah();
    await FirestoreServices.updateTableData(
      username: username,
      tableData: usersData[userIndex].data[dayIndex],
    );
    emit(HomeSuccessState());
  }

  Future<void> togglePrayInNabi({required int userIndex}) async {
    if (!_isAllowToEdit(userIndex: userIndex)) return;
    usersData[userIndex].data[dayIndex].togglePrayInNabi();
    await FirestoreServices.updateTableData(
      username: username,
      tableData: usersData[userIndex].data[dayIndex],
    );
    emit(HomeSuccessState());
  }

  Future<void> toggleQuranVerse({required int userIndex}) async {
    if (!_isAllowToEdit(userIndex: userIndex)) return;
    usersData[userIndex].data[dayIndex].toggleQuranVerse();
    await FirestoreServices.updateTableData(
      username: username,
      tableData: usersData[userIndex].data[dayIndex],
    );
    emit(HomeSuccessState());
  }

  Future<void> toggleMidnightQiam({required int userIndex}) async {
    if (!_isAllowToEdit(userIndex: userIndex)) return;
    usersData[userIndex].data[dayIndex].toggleMidnightQiam();
    await FirestoreServices.updateTableData(
      username: username,
      tableData: usersData[userIndex].data[dayIndex],
    );
    emit(HomeSuccessState());
  }

  Future<void> toggleEveningAzkar({required int userIndex}) async {
    if (!_isAllowToEdit(userIndex: userIndex)) return;
    usersData[userIndex].data[dayIndex].toggleEveningAzkar();
    await FirestoreServices.updateTableData(
      username: username,
      tableData: usersData[userIndex].data[dayIndex],
    );
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

  List<DateTime> get dates =>
      usersData.first.data.map((dayData) => dayData.dayDate).toList();

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

  Future<void> _initUsersAuth() async {
    emit(HomeLoadingState());
    final result = await FirestoreServices.getUserAuthList();
    result.fold(
      (failure) => emit(HomeErrorState(failure.message)),
      (usersAuth) {
        this.usersAuth = usersAuth;
        emit(HomeSuccessState());
      },
    );
  }

  void _sortUsersByUsername() {
    // Search for the index of the username
    final usernameIndex = usersData.indexWhere(
      (user) => user.username == username,
    );

    // Move it to the top
    if (usernameIndex != 0) {
      final user = usersData.removeAt(usernameIndex);
      usersData.insert(0, user);
    }

    // Update the user auth list in the same order
    for (var user in usersData) {
      final userAuth = usersAuth.firstWhere(
        (element) => element.username == user.username,
      );
      usersAuth.remove(userAuth);
      usersAuth.add(userAuth);
    }
  }

  bool _isAllowToEdit({required int userIndex}) {
    return username == usersData[userIndex].username;
  }

  // We call it only one time to initialize the Firebase Days
  Future<void> _initializeFirebaseDays() async {
    final List<DayModel> days = [];
    final DateTime initialDate = DateTime(2024, 8, 9);
    final DateTime lastDate = DateTime(2025, 1, 1);

    // Add the days between initial date and last date
    int dayIndex = 0;
    late DateTime date;
    date = initialDate;
    while (date.isBefore(lastDate)) {
      final dayModel = DayModel(
        index: dayIndex,
        date: date,
      );
      days.add(dayModel);

      dayIndex++;
      date = date.add(const Duration(days: 1));
    }

    // Add the days to Firestore
    for (var user in usersData) {
      for (var day in days) {
        await FirestoreServices.addDayDoc(
          username: user.username,
          tableData: TableDataModel.initial(
            dayIndex: day.index,
            dayDate: day.date,
          ),
        );
      }
    }
  }
}
