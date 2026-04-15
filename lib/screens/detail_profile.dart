import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_application_1/models/profile.dart';

class DetailProfile extends StatelessWidget {
  const DetailProfile({super.key, required this.profile});

  final Profile profile;

  @override
  Widget build(BuildContext context) {
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
                    decoration: const BoxDecoration(
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
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSFpilYZY5ru8svJkmZEZBhwtZuGTTNtjmQXw&s',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              profile.name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              profile.bio,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "Phone Number : ${profile.phone}",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
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

            const SizedBox(height: 50),

          ],
        ),
      ),
    );
  }
}
