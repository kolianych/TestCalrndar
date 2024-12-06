part of 'locale_bloc.dart';

//Локализация Event
abstract class LocaleEvent {}

class ChangeLocale extends LocaleEvent {
  final Locale locale;

  ChangeLocale(this.locale);
}
