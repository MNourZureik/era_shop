import 'package:era_shop/localization/language/arabic_language.dart';
import 'package:era_shop/localization/language/bangali_language.dart';
import 'package:era_shop/localization/language/chinese_language.dart';
import 'package:era_shop/localization/language/english_language.dart';
import 'package:era_shop/localization/language/french_language.dart';
import 'package:era_shop/localization/language/german_language.dart';
import 'package:era_shop/localization/language/hindi_language.dart';
import 'package:era_shop/localization/language/indonesian_language.dart';
import 'package:era_shop/localization/language/italian_language.dart';
import 'package:era_shop/localization/language/korean_language.dart';
import 'package:era_shop/localization/language/portuguese_language.dart';
import 'package:era_shop/localization/language/russian_language.dart';
import 'package:era_shop/localization/language/spanish_language.dart';
import 'package:era_shop/localization/language/swahili_language.dart';
import 'package:era_shop/localization/language/tamil_language.dart';
import 'package:era_shop/localization/language/telugu_language.dart';
import 'package:era_shop/localization/language/turkish_language.dart';
import 'package:era_shop/localization/language/urdu_language.dart';
import 'package:get/get.dart';

class AppLanguages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    "ar_DZ": ardz,
    "bn_In": bnIN,
    "zh_CN": zhCN,
    "en_US": enUS,
    "fr_Fr": frCH,
    "de_De": deat,
    "hi_IN": hiIN,
    "it_In": itIT,
    "id_ID": idID,
    "ko_KR": koKR,
    "pt_PT": ptPT,
    "ru_RU": ruRU,
    "es_ES": esES,
    "sw_KE": swKE,
    "tr_TR": trTR,
    "te_IN": teIN,
    "ta_IN": taIN,
    "ur_PK": urPK,
  };
}

final List<LanguageModel> languages = [
  LanguageModel("dz", "Arabic (العربية)", 'ar', 'DZ'),
  LanguageModel("🇮🇳", "Bengali (বাংলা)", 'bn', 'IN'),
  LanguageModel("🇨🇳", "Chinese Simplified (中国人)", 'zh', 'CN'),
  LanguageModel("🇺🇸", "English (English)", 'en', 'US'),
  LanguageModel("🇫🇷", "French (français)", 'fr', 'FR'),
  LanguageModel("🇩🇪", "German (Deutsche)", 'de', 'DE'),
  LanguageModel("🇮🇳", "Hindi (हिंदी)", 'hi', 'IN'),
  LanguageModel("🇮🇹", "Italian (italiana)", 'it', 'IT'),
  LanguageModel("🇮🇩", "Indonesian (bahasa indo)", 'id', 'ID'),
  LanguageModel("🇰🇵", "Korean (한국인)", 'ko', 'KR'),
  LanguageModel("🇵🇹", "Portuguese (português)", 'pt', 'PT'),
  LanguageModel("🇷🇺", "Russian (русский)", 'ru', 'RU'),
  LanguageModel("🇪🇸", "Spanish (Español)", 'es', 'ES'),
  LanguageModel("🇰🇪", "Swahili (Kiswahili)", 'sw', 'KE'),
  LanguageModel("🇹🇷", "Turkish (Türk)", 'tr', 'TR'),
  LanguageModel("🇮🇳", "Telugu (తెలుగు)", 'te', 'IN'),
  LanguageModel("🇮🇳", "Tamil (தமிழ்)", 'ta', 'IN'),
  LanguageModel("🇵🇰", "(اردو) Urdu", 'ur', 'PK'),
];

class LanguageModel {
  LanguageModel(
      this.symbol,
      this.language,
      this.languageCode,
      this.countryCode,
      );

  String language;
  String symbol;
  String countryCode;
  String languageCode;
}
