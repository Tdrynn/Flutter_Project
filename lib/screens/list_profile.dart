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
      profiles.add(
        Profile(
          id: lastIndex + 1,
          nim: "20",
          name: "Tude",
          bio: "Flutter Developer",
          phone: "081212999803",
        ),
      );
    });
  }

  void deleteitem(int id) {
    setState(() {
      profiles.removeWhere((profile) => profile.id == id);
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
            key: Key(profile.id.toString()), // ✅ lebih aman dari name
            onDismissed: (direction) {
              deleteitem(profile.id);
              Fluttertoast.showToast(msg: "${profile.name} dihapus");
            },
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://i.pravatar.cc/150?img=10',
                ),
              ),
              title: Text(profile.name),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(profile.bio),
                  SizedBox(height: 4),
                  Text(profile.phone, style: TextStyle(color: Colors.grey)),
                  Text(
                    "NIM: ${profile.nim}",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),

              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailProfile(profile: profile),
                ),
              ),
            ),
          );
        },
      ),

      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(onPressed: addItem, child: Icon(Icons.add)),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              if (profiles.isNotEmpty) {
                deleteitem(profiles.last.id);
              }
            },
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
