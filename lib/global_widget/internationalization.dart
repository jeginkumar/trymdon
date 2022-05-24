import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class TrymdLocalizations {
  TrymdLocalizations(this.locale);

  final Locale locale;

  static TrymdLocalizations of(BuildContext context) =>
      Localizations.of<TrymdLocalizations>(context, TrymdLocalizations);

  static List<String> languages() => ['en'];

  String get languageCode => locale.languageCode;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.languageCode] ?? '';

  String getVariableText({
    String en = '',
  }) =>
      [en][languageIndex] ?? '';
}

class TrymdLocalizationsDelegate
    extends LocalizationsDelegate<TrymdLocalizations> {
  const TrymdLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      TrymdLocalizations.languages().contains(locale.languageCode);

  @override
  Future<TrymdLocalizations> load(Locale locale) =>
      SynchronousFuture<TrymdLocalizations>(TrymdLocalizations(locale));

  @override
  bool shouldReload(TrymdLocalizationsDelegate old) => false;
}

final kTranslationsMap =
    <Map<String, Map<String, String>>>[].reduce((a, b) => a..addAll(b));
