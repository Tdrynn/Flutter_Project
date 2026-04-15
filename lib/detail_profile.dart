import 'package:flutter/material.dart';

class DetailProfile extends StatefulWidget {
  final String nama;
  final int angka;

  const DetailProfile({super.key, required this.nama, required this.angka});

  @override
  State<DetailProfile> createState() => _DetailProfileState();
}

class _DetailProfileState extends State<DetailProfile> {
  late String nama;
  bool isChanged = false;
  String teks = "Tude Ryan Wijaya Kusuma";

  @override
  void initState() {
    super.initState();
    nama = widget.nama;
  }

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
              nama,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              '2415354020',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w100),
            ),
            const SizedBox(height: 8),
            Text(
              'Counter saat ini: ${widget.angka}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                textAlign: TextAlign.justify,
              ),
            ),
            const SizedBox(height: 32),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  isChanged = !isChanged;
                  teks = isChanged
                      ? "Tude Ryan"
                      : "Tude Ryan Wijaya Kusuma";
                });
              },
              child: Text(teks),
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