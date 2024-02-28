import 'package:demo_exam/features/presentation/screens/tickets/ticket_create_close.dart';
import 'package:demo_exam/features/presentation/screens/tickets/ticket_create_open.dart';
import 'package:demo_exam/features/presentation/screens/tickets/widgets/list_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/provider/tickets/close_provider_hive.dart';
import '../../../data/provider/tickets/open_provider_hive.dart';

class TicketPage extends StatelessWidget {
  TicketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ticketProviderHiveOpen = Provider.of<OpenProviderHive>(context);
    final ticketProviderHiveClose = Provider.of<CloseProviderHive>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tickets List",
          style: TextStyle(fontSize: 30),
        ),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TicketCreateOpen(
                    itemKey: null,
                    eventProviderHive: ticketProviderHiveOpen,
                    ctx: context,
                  ),
                ),
              );
            },
            child: Text("Create a new ticket Opening"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TicketCreateClose(
                    itemKey: null,
                    eventProviderHiveClose: ticketProviderHiveClose,
                    ctx: context,
                  ),
                ),
              );
            },
            child: Text("Create a new ticket Closing"),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Opening Ceremony",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Consumer<OpenProviderHive>(
            builder: (context, data, child) {
              return Expanded(
                child: ListBuilder(data, ticketProviderHiveOpen, context,
                    aty: "open"),
              );
            },
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Closing Ceremony",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Consumer<CloseProviderHive>(
            builder: (context, data, child) {
              return Expanded(
                child: ListBuilder(data, ticketProviderHiveClose, context,
                    aty: "close"),
              );
            },
          ),
        ],
      ),
    );
  }
}
