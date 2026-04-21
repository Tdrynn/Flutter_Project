import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/profile.dart';
import 'package:flutter_application_1/screens/detail_profile.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ListProfile extends StatefulWidget {
  const ListProfile({super.key});

  @override
  State<ListProfile> createState() => _ListProfileState();
}

class _ListProfileState extends State<ListProfile> {
  List<Profile> profiles = [];

  void addItem() {
    setState(() {
      int lastIndex = profiles.length;
      int step = 20;
      profiles.add(
        Profile(
          id: lastIndex + 1,
          step: step,
          name: "Tude",
          bio: "Flutter Developer",
          phone: "0812129998",
        ),
      );
    });
  }

  void deleteitem(int index) {
    setState(() {
      profiles.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List Profile')),
      body: ListView.builder(
        itemCount: profiles.length,
        itemBuilder: (context, index) {
          final profile = profiles[index];
          return Dismissible(
            key: Key(profile.name),
            onDismissed: (direction) {
              final deletedItem = profiles[index];
              deleteitem(index);
              Fluttertoast.showToast(msg: "${deletedItem.name} dihapus");
            },
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://i.pravatar.cc/150?img=10',
                ),
              ),
              title: Text(profile.displayName(index)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(profile.bio),
                  SizedBox(height: 4),
                  Text(
                    profile.displayPhone(index),
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              onTap: () async{
                final updatedProfile = await Navigator.push (
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailProfile(profile: profile),
                  ),
                );

                if (updatedProfile != null) {
                  setState(() {
                    for (var p in profiles) {
                      p.step = updatedProfile.step;
                    }
                  });
                }
              },
            ),
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {
              addItem();
            },
            child: Icon(Icons.add),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              if (profiles.isNotEmpty) {
                deleteitem(profiles.length - 1);
              }
            },
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
