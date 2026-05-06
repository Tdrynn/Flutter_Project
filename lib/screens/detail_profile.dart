import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/profile_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_application_1/screens/edit_profile.dart';
import 'package:provider/provider.dart';

class DetailProfile extends StatelessWidget {
  final int profileId;

  const DetailProfile({super.key, required this.profileId});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProfileProvider>();

    final profile = provider.profiles.firstWhere((p) => p.id == profileId);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Profile'),
        backgroundColor: Color.fromARGB(255, 216, 220, 168),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/background1.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 110,
                    child: CircleAvatar(
                      radius: 80,
                      backgroundImage: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSFpilYZY5ru8svJkmZEZBhwtZuGTTNtjmQXw&s'),
                    ),
                  ),
                ],
              ),
            ),
            
            Text(
              profile.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              profile.bio,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              profile.phone20,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              profile.nim,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                textAlign: TextAlign.justify,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Fluttertoast.showToast(msg: "Button ini belum memiliki fungsi");
              },
              child: Text("Klik Saya"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Go Back"),
            ),
            ElevatedButton(
              onPressed: () async {
                final updatedProfile = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditProfile(id: profileId),
                  ),
                );

                if (updatedProfile != null) {
                  provider.updateProfile(profileId, updatedProfile);
                  Fluttertoast.showToast(msg: 'Profile berhasil diperbarui');
                }
              },
              child: const Text("Edit Profile"),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
