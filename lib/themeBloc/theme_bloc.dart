import 'package:flutter_bloc/flutter_bloc.dart';

enum ThemeEvent { toggle }

//Bloc для переключения темы темная/светлая

class ThemeBloc extends Bloc<ThemeEvent, bool> {
  ThemeBloc() : super(false) {
    // false - темная тема, true - светлая тема

    // Регистрируем обработчик для события toggle
    on<ThemeEvent>((event, emit) {
      if (event == ThemeEvent.toggle) {
        emit(!state); // Переключаем тему
      }
    });
  }
}
