import 'package:flutter/material.dart';

import '../../../data/provider/tickets/open_provider_hive.dart';

class TicketCreateOpen extends StatelessWidget {
  int? itemKey;
  OpenProviderHive eventProviderHive;
  BuildContext ctx;

  TicketCreateOpen(
      {super.key,
      required this.itemKey,
      required this.eventProviderHive,
      required this.ctx});

  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (itemKey != null) {
      final existingItem = eventProviderHive.items
          .firstWhere((element) => element["key"] == itemKey);
      _nameController.text = existingItem["name"];
      _surnameController.text = existingItem["place"];
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Open Ticket Create",
          style: TextStyle(fontSize: 30),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(
          top: 10,
          left: 15,
          right: 15,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(hintText: "Name"),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: _surnameController,
              decoration: const InputDecoration(hintText: "place"),
            ),
            SizedBox(
              height: 15,
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () async {
                if (itemKey == null) {
                  eventProviderHive.createItem(
                    {
                      "name": _nameController.text.trim(),
                      "place": _surnameController.text.trim(),
                    },
                  );
                } else {
                  eventProviderHive.updateItem(
                    itemKey!,
                    {
                      "name": _nameController.text.trim(),
                      "place": _surnameController.text.trim(),
                    },
                  );
                }
                _nameController.clear();
                _surnameController.clear();
                Navigator.of(ctx).pop();
              },
              child: Text(itemKey == null ? "Create New" : "Update"),
            ),
          ],
        ),
      ),
    );
  }
}
