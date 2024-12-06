// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ru';

  static String m0(e) => "Произошла ошибка: ${e}";

  static String m1(state) => "Ошибка: ${state}";

  static String m2(selectedTime) => "Выбрать время: ${selectedTime}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "addEvent": MessageLookupByLibrary.simpleMessage("Добавить событие"),
        "alreadyHaveAnAccount":
            MessageLookupByLibrary.simpleMessage("У вас уже есть аккаунт?"),
        "anErrorOccurredE": m0,
        "areYouSureYouWantToDelete": MessageLookupByLibrary.simpleMessage(
            "Вы уверены, что хотите удалить?"),
        "attentionDialog": MessageLookupByLibrary.simpleMessage("Внимание!"),
        "backDialog": MessageLookupByLibrary.simpleMessage("Назад"),
        "cancel": MessageLookupByLibrary.simpleMessage("Отменить"),
        "cybpeApp": MessageLookupByLibrary.simpleMessage("Приложение событий"),
        "days": MessageLookupByLibrary.simpleMessage("дн."),
        "deleteEvent": MessageLookupByLibrary.simpleMessage("Удалить событие"),
        "description": MessageLookupByLibrary.simpleMessage("Описание"),
        "done": MessageLookupByLibrary.simpleMessage("Выполнено?"),
        "dontHaveAnAccount":
            MessageLookupByLibrary.simpleMessage("У вас нет учетной записи?"),
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "enterEventTitle":
            MessageLookupByLibrary.simpleMessage("Введите заголовок события"),
        "errorState": m1,
        "events": MessageLookupByLibrary.simpleMessage("Событие"),
        "eventsCalendar":
            MessageLookupByLibrary.simpleMessage("Список событий"),
        "hours": MessageLookupByLibrary.simpleMessage("час"),
        "invalidEmailOrPassword": MessageLookupByLibrary.simpleMessage(
            "Неверный адрес электронной почты или пароль."),
        "listOfEvents": MessageLookupByLibrary.simpleMessage("Список событий"),
        "login": MessageLookupByLibrary.simpleMessage("Войти"),
        "minutes": MessageLookupByLibrary.simpleMessage("мин."),
        "no": MessageLookupByLibrary.simpleMessage("Нет"),
        "password": MessageLookupByLibrary.simpleMessage("Пароль"),
        "remindFor": MessageLookupByLibrary.simpleMessage("Напомнить за:"),
        "save": MessageLookupByLibrary.simpleMessage("Сохранить"),
        "selectedtime": m2,
        "signUp": MessageLookupByLibrary.simpleMessage("Зарегистрироваться"),
        "signup": MessageLookupByLibrary.simpleMessage("Регистрация"),
        "someErrorHappend":
            MessageLookupByLibrary.simpleMessage("Произошла какая-то ошибка"),
        "someErrorOccured":
            MessageLookupByLibrary.simpleMessage("произошла какая-то ошибка"),
        "textDialog": MessageLookupByLibrary.simpleMessage(
            "Вы пытаетесь установить дату, которая уже прошла, или текущую дату и время в качестве запланированной даты. Ведите коректную дату."),
        "theEmailAddressIsAlreadyInUse": MessageLookupByLibrary.simpleMessage(
            "Адрес электронной почты уже используется."),
        "thereAreNoEventsForThisDay":
            MessageLookupByLibrary.simpleMessage("Нет событий для этого дня."),
        "thereAreNoEventsToDisplay": MessageLookupByLibrary.simpleMessage(
            "Нет событий для отображения."),
        "title": MessageLookupByLibrary.simpleMessage("Заголовок"),
        "turnOnNotificationsInTheApp": MessageLookupByLibrary.simpleMessage(
            "Включите уведомления в приложение!"),
        "userIsSuccessfullyCreated":
            MessageLookupByLibrary.simpleMessage("Пользователь успешно создан"),
        "userIsSuccessfullySignedIn": MessageLookupByLibrary.simpleMessage(
            "Пользователь успешно вошел в систему"),
        "username": MessageLookupByLibrary.simpleMessage("Имя пользователя"),
        "yes": MessageLookupByLibrary.simpleMessage("Да")
      };
}
