import 'package:demo_exam/features/data/model/event_model.dart';
import 'package:flutter/material.dart';

class EventDetails extends StatelessWidget {
  final EventC event;

  EventDetails({
    required this.event,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Details'),
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Text(
                'Title: ${event.eventTitle}',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text('pictures', style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/images/${event.eventPictures[0]}",
                    width: 110,
                    height: 110,
                  ),
                  Image.asset(
                    "assets/images/${event.eventPictures[1]}",
                    width: 110,
                    height: 110,
                  ),
                  Image.asset(
                    "assets/images/${event.eventPictures[2]}",
                    width: 110,
                    height: 110,
                  ),
                ],
              ),
              Text(event.eventText, style: const TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ]),
    );
  }
}
