import 'package:flutter/cupertino.dart';

import '../../model/converter.dart';
import '../../model/event_model.dart';

class EventProvider extends ChangeNotifier {
  List<EventC> testList = [];
  List<EventC> foundList = [];

  void init() {
    testList = eventList;
    foundList = eventList;
  }

  List<EventC> get events => foundList;

  void sortEvent(String enteredKeyword) {
    List<EventC> results = [];
    if (enteredKeyword.toLowerCase().contains("true")) {
      results = testList
          .where((event) => event.eventReadStatus
              .toString()
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    } else if (enteredKeyword.toLowerCase().contains("false")) {
      results = testList
          .where((event) => event.eventReadStatus
              .toString()
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    } else {
      results = testList;
    }
    foundList = results;
    notifyListeners();
  }
}
