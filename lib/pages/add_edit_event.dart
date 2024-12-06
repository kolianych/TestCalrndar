import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter_calendar_zadach/generated/l10n.dart';
import 'package:flutter_calendar_zadach/local_notifications.dart';
import 'package:flutter_calendar_zadach/model/event.dart';
import 'package:intl/intl.dart';

//страница (форма) для ввода или редактирования события

class AddEditEvent extends StatefulWidget {
  final String? id;
  final DateTime firstDate;
  final DateTime lastDate;
  final DateTime? selectedDate;
  final Event? event; //

  const AddEditEvent(
      {super.key,
      this.id,
      required this.firstDate,
      required this.lastDate,
      this.selectedDate,
      this.event //
      });

  @override
  State<AddEditEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEditEvent> {
  late DateTime _selectedDate;
  late TimeOfDay _selectedTime;
  var _titleController = TextEditingController();
  var _descController = TextEditingController();
  final _reminderController = TextEditingController(text: '0');
  int? selectedValue = 0;
  late bool checkbox = false;

  @override
  void initState() {
    super.initState();
    if (widget.event == null) {
      _selectedDate = widget.selectedDate ?? DateTime.now();
      _selectedTime = TimeOfDay.fromDateTime(DateTime.now());
    } else {
      _selectedDate = widget.event!.date;
      _selectedTime = TimeOfDay.fromDateTime(widget.event!.date);
      _selectedTime = TimeOfDay.fromDateTime(widget.event!.date);
      _titleController = TextEditingController(text: widget.event!.title);
      _descController = TextEditingController(text: widget.event!.description);
      checkbox = widget.event!.check;
      _reminderController.text = widget.event!.upcomingNotification.toString();
      selectedValue = widget.event!.format;
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final bool is24HourFormat = Localizations.localeOf(context).languageCode ==
        'ru'; // Проверка локализации

    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
      initialEntryMode: TimePickerEntryMode.input,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
              alwaysUse24HourFormat:
                  is24HourFormat), // Используем проверку локализации
          child: child!,
        );
      },
    );

    if (newTime != null) {
      setState(() {
        _selectedTime = newTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).addEvent),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Row(
            children: [
              Expanded(
                child: InputDatePickerFormField(
                  firstDate: widget.firstDate,
                  lastDate: widget.lastDate,
                  initialDate: _selectedDate,
                  onDateSubmitted: (date) {
                    setState(() {
                      _selectedDate = date;
                    });
                  },
                ),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                onPressed: () => _selectTime(context),
                child: Text(
                    S.of(context).selectedtime(_selectedTime.format(context))),
              ),
            ],
          ),
          const SizedBox(height: 10),
          TextField(
            controller: _titleController,
            maxLines: 1,
            decoration: InputDecoration(
                labelText: S.of(context).title,
                border: const OutlineInputBorder()),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: _descController,
            maxLines: 5,
            decoration: InputDecoration(
                labelText: S.of(context).description,
                border: const OutlineInputBorder()),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(S.of(context).remindFor),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: TextField(
                  controller: _reminderController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
              const SizedBox(width: 10),
              DropdownButton<int>(
                value: selectedValue,
                elevation: 0,
                items: [
                  DropdownMenuItem(
                      value: 0, child: Text(S.of(context).minutes)),
                  DropdownMenuItem(value: 1, child: Text(S.of(context).hours)),
                  DropdownMenuItem(value: 2, child: Text(S.of(context).days)),
                ],
                onChanged: (value) {
                  setState(() {
                    selectedValue = value;
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    if (_titleController.text.isNotEmpty) {
                      final DateTime originalDate = DateTime(
                        _selectedDate.year,
                        _selectedDate.month,
                        _selectedDate.day,
                        _selectedTime.hour,
                        _selectedTime.minute,
                      );

                      DateTime dateNonification;

                      switch (selectedValue) {
                        case 0:
                          dateNonification = originalDate.subtract(Duration(
                              minutes:
                                  int.tryParse(_reminderController.text) ?? 0));
                          break;
                        case 1:
                          dateNonification = originalDate.subtract(Duration(
                              hours:
                                  int.tryParse(_reminderController.text) ?? 0));
                          break;
                        case 2:
                          dateNonification = originalDate.subtract(Duration(
                              days:
                                  int.tryParse(_reminderController.text) ?? 0));
                          break;
                        default:
                          dateNonification = originalDate;
                      }
                      if (!dateNonification.isBefore(DateTime.now())) {
                        NotificationService.scheduledNotification(
                            _titleController.text,
                            _descController.text,
                            dateNonification);

                        _addEvent();
                      } else {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(S.of(context).attentionDialog),
                                content: Text(S.of(context).textDialog),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pop(); // Закрытие диалога
                                    },
                                    child: Text(S.of(context).backDialog),
                                  ),
                                ],
                              );
                            });
                      }
                    } else {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(S.of(context).attentionDialog),
                              content: Text(S.of(context).enterEventTitle),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(); // Закрытие диалога
                                  },
                                  child: Text(S.of(context).backDialog),
                                ),
                              ],
                            );
                          });
                    }
                  },
                  child: Text(S.of(context).save),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(S.of(context).cancel),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(S.of(context).done),
              Checkbox(
                value: checkbox,
                onChanged: (value) {
                  setState(() {
                    checkbox = !checkbox;
                  });
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  void _addEvent() async {
    final title = _titleController.text;
    final description = _descController.text;
    if (title.isEmpty) {
      return;
    }

    // Создаем окончательную дату и время
    DateTime finalDateTime = DateTime(
      _selectedDate.year,
      _selectedDate.month,
      _selectedDate.day,
      _selectedTime.hour,
      _selectedTime.minute,
    );

    // Сохраняем событие в Firestore
    if (widget.event == null) {
      await FirebaseFirestore.instance.collection(widget.id!).add({
        "title": title,
        "description": description,
        "date": Timestamp.fromDate(finalDateTime),
        "check": checkbox,
        "upcomingNotification": int.tryParse(_reminderController.text) ?? 0,
        "format": selectedValue,
      });
    } else {
      await FirebaseFirestore.instance
          .collection(widget.id!)
          .doc(widget.event!.id)
          .update({
        "title": title,
        "description": description,
        "date": Timestamp.fromDate(finalDateTime),
        "check": checkbox,
        "upcomingNotification": int.tryParse(_reminderController.text) ?? 0,
        "format": selectedValue,
      });
    }

    if (mounted) {
      Navigator.pop<bool>(context, true);
    }
  }

  String getFormattedDate(DateTime date) {
    return DateFormat('dd-MM-yyyy').format(date); // Форматируем дату
  }
}
