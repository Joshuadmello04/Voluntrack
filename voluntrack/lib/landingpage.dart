import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Welcome back 👋',
          style: TextStyle(color: Colors.black87, fontSize: 20),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined, color: Colors.black87),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User's name fetched from Firestore
              FutureBuilder<DocumentSnapshot>(
                future: _getUserData(), // Fetch user data
                builder: (BuildContext context,
                    AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  }
                  if (snapshot.hasError) {
                    return const Text("Error loading name");
                  }
                  if (!snapshot.hasData || !snapshot.data!.exists) {
                    return const Text("User not found");
                  }

                  String fullName = snapshot.data!['fullName'] ??
                      'Volunteer'; // Fetch fullName from the document

                  return Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      fullName,
                      style: const TextStyle(
                          fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),

              // Search Bar
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(Icons.search),
                      hintText: 'Search',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Invite Friends Section
              Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: const DecorationImage(
                    image: AssetImage(
                        '../assets/hands.jpg'), // Replace with your asset
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: const LinearGradient(
                      colors: [Colors.black54, Colors.transparent],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'More people, more impact.',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            "Let's help the community together!",
                            style:
                                TextStyle(color: Colors.white70, fontSize: 14),
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orangeAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text(
                              'Invite Friends',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Recommended for You Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Recommended for You',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'View All',
                    style: TextStyle(fontSize: 16, color: Colors.orangeAccent),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Horizontal Scroll of Event Cards
              SizedBox(
                height: 250,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildEventCard(
                      title:
                          'Meals on Wheels: Seattle/Belltown Volunteer Caller and Office Support',
                      date: 'Oct 30, 2022 • 08:30 AM',
                      organization: 'Sound Generations',
                      image: '../assets/hands2.jpg', // Replace with asset
                    ),
                    _buildEventCard(
                      title:
                          'Volunteer Cleanup: Help Rebuild Homes After Flood',
                      date: 'Nov 05, 2022 • 10:00 AM',
                      organization: 'Rebuild Together',
                      image: '../assets/helping.jpg', // Replace with asset
                    ),
                    // Add more cards as needed
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.orangeAccent,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  // Fetch user data based on current user's UID
  Future<DocumentSnapshot> _getUserData() async {
    User? user = FirebaseAuth.instance.currentUser; // Get current user
    if (user != null) {
      return await FirebaseFirestore.instance
          .collection('Volunteer')
          .doc(user.uid) // Fetch document using UID
          .get();
    } else {
      throw Exception("No user signed in");
    }
  }

  // Widget for building Event Cards
  Widget _buildEventCard({
    required String title,
    required String date,
    required String organization,
    required String image,
  }) {
    return Container(
      width: 250,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: const LinearGradient(
            colors: [Colors.black54, Colors.transparent],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                date,
                style: const TextStyle(color: Colors.white70, fontSize: 14),
              ),
              const SizedBox(height: 5),
              Text(
                organization,
                style:
                    const TextStyle(color: Colors.orangeAccent, fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
