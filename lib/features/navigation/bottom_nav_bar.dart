import 'package:demo_exam/features/presentation/screens/events/event_page.dart';
import 'package:demo_exam/features/presentation/screens/tickets/ticket_page.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int index = 0;

  final scrrens = [
    EventPage(),
    TicketPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: scrrens[index],
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
            indicatorColor: Colors.blue.shade100,
            labelTextStyle: MaterialStateProperty.all(
                TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          ),
          child: NavigationBar(
            height: 60,
            selectedIndex: index,
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            animationDuration: Duration(seconds: 1),
            onDestinationSelected: (index) =>
                setState(() => this.index = index),
            destinations: [
              NavigationDestination(
                icon: Icon(
                  Icons.list,
                ),
                label: "Events",
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.airplane_ticket,
                ),
                label: "Ticets",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
