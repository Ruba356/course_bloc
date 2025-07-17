const Map<String, Map<String, String>> translations = {
  'en': {'home': 'Home'},
  'ar': {'home': 'الرئيسية'},
};

String currentLang = 'en';

String tr(String key) {
  return translations[currentLang]?[key] ?? key;
}