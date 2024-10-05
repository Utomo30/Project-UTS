import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.greenAccent.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.grey.shade300,
                      child: Icon(Icons.person, size: 50),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 20,
                    child: Icon(Icons.camera_alt),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ListTile(
              title: Text("Display name"),
              subtitle: Text("wirawahyu"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Divider(),
            ListTile(
              title: Text("Status message"),
              subtitle: Text("Not set"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Divider(),
            ListTile(
              title: Text("Phone number"),
              subtitle: Text("+62 822-9628-6845"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Divider(),
            ListTile(
              title: Text("ID"),
              subtitle: Row(
                children: [
                  Text("wirawahyu"),
                  Spacer(),
                  TextButton(onPressed: () {}, child: Text("Copy")),
                ],
              ),
            ),
            Divider(),
            SwitchListTile(
              title: Text("Allow others to add me by ID"),
              value: true,
              onChanged: (val) {},
            ),
            Divider(),
            ListTile(
              title: Text("QR code"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Divider(),
            ListTile(
              title: Text("Birthday"),
              subtitle: Text("Not set"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ),
    );
  }
}
