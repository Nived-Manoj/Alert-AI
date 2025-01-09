import 'package:camera_detection_app/view/accounts_screen.dart';
import 'package:camera_detection_app/view/detail_alert_screen.dart';
import 'package:camera_detection_app/view/login_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.teal,
        title: Text(
          "Home",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
            onSelected: (String value) {
              switch (value) {
                case "Account":
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AccountsScreen(),
                    ),
                  );
                  break;

                case "LogOut":
                  _showLogoutConfirmationDialog(context);
                  break;
                default:
                  break;
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem<String>(
                  value: "Account",
                  child: Text("Account"),
                ),
                PopupMenuItem<String>(
                  value: "LogOut",
                  child: Text(
                    "LogOut",
                    style: TextStyle(color: Colors.redAccent),
                  ),
                ),
              ];
            },
          ),
        ],
      ),
      backgroundColor: Colors.blueGrey[900],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedContainer(
              duration: Duration(seconds: 2),
              curve: Curves.easeInOut,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blueGrey[700],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container(
                height: 250,
                width: double.infinity,
                child: Stack(children: [
                  Image.asset(
                    "assets/images/visual3.jpg",
                    fit: BoxFit.contain,
                  ),
                  Positioned(
                    bottom: 10,
                    child: Row(
                      children: [
                        Text(
                          "Camera 1",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 150,
                        ),
                        Text(
                          "12/12/2025",
                          style: TextStyle(
                            color: Colors.tealAccent,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
            SizedBox(height: 20),
            ListView.builder(
              itemCount: 10,
              shrinkWrap:
                  true, // To prevent overflow issues when inside a Column
              physics:
                  NeverScrollableScrollPhysics(), // Prevent scrolling conflict
              itemBuilder: (context, index) {
                return AnimatedContainer(
                  duration: Duration(milliseconds: 800),
                  curve: Curves.easeInOut,
                  margin: EdgeInsets.symmetric(vertical: 8),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[800],
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AlertScreen(),
                        ),
                      );
                    },
                    child: ListTile(
                      leading: Icon(
                        Icons.camera_alt,
                        color: Colors.tealAccent,
                      ),
                      title: Text(
                        "Camera ${index + 1}",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        "Last updated: ${DateTime.now().toLocal()}",
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.tealAccent,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

void _showLogoutConfirmationDialog(BuildContext context) async {
  bool shouldLogout = await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.blueGrey[800],
        title: Text(
          "LogOut ?",
          style: TextStyle(color: Colors.white),
        ),
        content: Text(
          "Are you sure you want to log out?",
          style: TextStyle(color: Colors.white70),
        ),
        actions: [
          Container(
            decoration: BoxDecoration(
              color: Colors.blueGrey[800],
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text(
                "Cancel",
                style: TextStyle(color: Colors.tealAccent),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.blueGrey[800],
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pop(true); // Close the dialog and confirm logout
              },
              child: Text(
                "Logout",
                style:
                    TextStyle(color: Colors.redAccent), // Logout button color
              ),
            ),
          ),
        ],
      );
    },
  );

  if (shouldLogout) {
    // Only navigate after the dialog is dismissed
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginScreen(), // Your Login screen widget
      ),
    );
  }
}
