import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'locale_event.dart';
part 'locale_state.dart';

//Локализация Bloc
class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
  LocaleBloc() : super(LocaleState(locale: const Locale('en'))) {
    on<ChangeLocale>((event, emit) {
      emit(LocaleState(locale: event.locale));
    });
  }
}
