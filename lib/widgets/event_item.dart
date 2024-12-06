import 'package:flutter/material.dart';
import 'package:flutter_calendar_zadach/controller/data_time_controller.dart';
import 'package:intl/intl.dart';

import '../model/event.dart';

//виджет карточки события, который отображается под каледарем и в списке событий
class EventItem extends StatelessWidget {
  final Event event;
  final Function() onDelete;
  final Function()? onTap;
  const EventItem({
    super.key,
    required this.event,
    required this.onDelete,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const Color colotTheme = Colors.black;
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: _colorMetod(event),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ListTile(
        title: Text(
          DateFormat('dd-MM-yyyy HH:mm').format(event.date),
          style: const TextStyle(color: colotTheme),
        ),
        subtitle: Text(
          event.title,
          style: const TextStyle(color: colotTheme),
        ),
        onTap: onTap,
        leading: Icon(
          (event.check)
              ? (event.check)
                  ? Icons.check_circle_outline
                  : Icons.error_outline
              : Icons.error_outline,
          color: colotTheme,
        ),
        trailing: IconButton(
          icon: const Icon(
            Icons.delete,
            color: colotTheme,
          ),
          onPressed: onDelete,
        ),
      ),
    );
  }

  _colorMetod(Event event) {
    final DateTime dateNonification =
        DataTimeController.calculateNotificationDate(event);

    if (event.date.isBefore(DateTime.now()) && !event.check) {
      return Colors.red;
    } else if (dateNonification.isBefore(DateTime.now()) && !event.check) {
      return Colors.yellow;
    } else {
      return Colors.green;
    }
  }
}
