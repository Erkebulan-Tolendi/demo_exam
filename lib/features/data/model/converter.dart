import 'package:demo_exam/features/data/model/event_model.dart';

import '../json/datas.dart';

List<EventC> eventList = events.map(
  (eventData) {
    return EventC(
      eventId: eventData['eventId'],
      eventTitle: eventData['eventTitle'],
      eventText: eventData['eventText'],
      eventReadStatus: eventData['eventReadStatus'],
      eventPictures: eventData['eventPictures'],
    );
  },
).toList();
