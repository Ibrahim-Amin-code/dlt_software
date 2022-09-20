// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  static AppCubit get(context) => BlocProvider.of(context);

  bool isActive = false;
  void changeNotificationActive() {
    isActive = !isActive;
    emit(ChangeNotificationActivationState());
  }

///////////////////////////////////////////////////////////////////
  // bool isArabic = false;
  // bool isEnglish = false;
  // void changeLanguage() {
  //   if (prefs.getString("lang") != null) {
  //     if (prefs.getString("lang") == "en") {
  //       isEnglish = true;
  //       isArabic = false;
  //       emit(ChangeLanguageState());
  //     } else {
  //       isEnglish = false;
  //       isArabic = true;
  //       emit(ChangeLanguageState());
  //     }
  //   } else {
  //     if (Platform.localeName.split('_')[0] == "en") {
  //       isEnglish = true;
  //       isArabic = false;
  //       emit(ChangeLanguageState());
  //     } else {
  //       isEnglish = false;
  //       isArabic = true;
  //       emit(ChangeLanguageState());
  //     }
  //   }
  // }
}
