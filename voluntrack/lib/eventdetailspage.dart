import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EventDetailsPage extends StatelessWidget {
  final String title; // Declare the title variable

  // Constructor accepting the title parameter
  const EventDetailsPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Details'),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(Icons.arrow_back, color: Colors.black),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dummy Image at the top
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      '../assets/logo.jpg'), // Replace with a dummy image
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Event title
                  Text(
                    'Meals on Wheels: Bandra Fair Caller and Office Support',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  // Organization
                  Row(
                    children: [
                      Icon(Icons.circle, color: Colors.orange, size: 24),
                      SizedBox(width: 8),
                      Text(
                        'Sound Generations',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  // Event Details Section
                  Text(
                    'Event Details',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  // Event Date
                  Row(
                    children: [
                      Icon(Icons.calendar_today_outlined, color: Colors.orange),
                      SizedBox(width: 8),
                      Text(
                        'Fri, 28th Oct, 2022',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  // Event Time
                  Row(
                    children: [
                      Icon(Icons.access_time_outlined, color: Colors.orange),
                      SizedBox(width: 8),
                      Text(
                        '08:30 AM - 12:30 PM',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  // Event Location
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined, color: Colors.orange),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          '2208 2nd Ave #100, Seattle, WA 98121',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  // Participants Info
                  Row(
                    children: [
                      Icon(Icons.people_outline, color: Colors.orange),
                      SizedBox(width: 8),
                      Text(
                        'Grace, Jasmine, and 16 people are going.',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  // Invite Button
                  ElevatedButton(
                    onPressed: () async {
                      const url =
                          'https://www.google.com/maps/place/Mount+Mary,+Bandra+West,+Mumbai,+Maharashtra+400050/data=!4m2!3m1!1s0x3be7c9463ca49b3d:0x3ec0d5b1ce734a4a?sa=X&ved=1t:242&ictx=111';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange, // updated parameter
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text('View Location'),
                  ),
                  SizedBox(height: 16),
                  // Join Event Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Show dialog when "Join Event" is clicked
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    // Checkmark Icon
                                    Icon(
                                      Icons.check_circle_outline,
                                      color: Colors.orange,
                                      size: 80,
                                    ),
                                    SizedBox(height: 16),
                                    // Success Text
                                    Text(
                                      'You successfully joined this event!',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(height: 8),
                                    // Additional Text
                                    Text(
                                      'Thank you for your support. Let’s invite some friends to go with you and help the community together!',
                                      style: TextStyle(fontSize: 16),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(height: 16),
                                    // Invite Friends Button
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        // Add your invite logic here
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.orange,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      child: Text('Join Group Chat'),
                                    ),
                                    SizedBox(height: 8),
                                    // Skip for now button
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text(
                                        'Skip for now',
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange, // updated parameter
                        padding: EdgeInsets.all(16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Join Event',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
