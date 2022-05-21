enum LanguageType {
  ENGLISH,
  ARABIC,
}

const String ENGLISH = "en";
const String ARABIC = "ar";

extension LanguageTypeExtension on LanguageType {
  String geValue() {
    switch (this) {
      case LanguageType.ENGLISH:
        return ENGLISH;
      case LanguageType.ARABIC:
        return ARABIC;
    }
  }
}
