import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateGroupScreen extends StatefulWidget {
  const CreateGroupScreen({super.key});

  @override
  State<CreateGroupScreen> createState() => _CreateGroupScreenState();
}

class _CreateGroupScreenState extends State<CreateGroupScreen> {
  final TextEditingController _groupNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, dynamic>> contacts = [
    {"name": "alice_smith", "online": true, "avatar": "A"},
    {"name": "sarah_wilson", "online": true, "avatar": "S"},
    {"name": "john_doe", "online": false, "avatar": "J"},
  ];

  final Set<String> selectedContacts = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Group"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: ListView(
          children: [
            // ---- Group Details Section ----
            const Text(
              "Group Details",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 10.h),

            // Group Photo
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40.r,
                    backgroundColor: Colors.grey.shade300,
                    child: Icon(Icons.camera_alt, color: Colors.grey.shade600),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    "Add a photo for your group",
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),

            // Group Name
            TextField(
              controller: _groupNameController,
              decoration: InputDecoration(
                labelText: "Group Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ),
            SizedBox(height: 15.h),

            // Description
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: "Description (Optional)",
                hintText: "What’s this group about?",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ),
            SizedBox(height: 25.h),

            // ---- Add Members Section ----
            const Text(
              "Add Members",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 10.h),

            // Search Bar
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: "Search contacts...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              onChanged: (_) => setState(() {}),
            ),
            SizedBox(height: 15.h),

            // Contact List
            ...contacts
                .where((contact) => contact["name"]
                    .toLowerCase()
                    .contains(_searchController.text.toLowerCase()))
                .map((contact) {
              final isSelected = selectedContacts.contains(contact["name"]);
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey.shade300,
                  child: Text(
                    contact["avatar"],
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
                title: Text(contact["name"]),
                subtitle: Text(
                  contact["online"] ? "Online" : "Offline",
                  style: TextStyle(
                    color: contact["online"] ? Colors.green : Colors.grey,
                    fontSize: 12,
                  ),
                ),
                trailing: Checkbox(
                  value: isSelected,
                  onChanged: (_) {
                    setState(() {
                      if (isSelected) {
                        selectedContacts.remove(contact["name"]);
                      } else {
                        selectedContacts.add(contact["name"]);
                      }
                    });
                  },
                ),
              );
            }),

            SizedBox(height: 20.h),
          ],
        ),
      ),

      // ---- Bottom Button ----
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16.w),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: selectedContacts.isNotEmpty
                ? Colors.blue
                : Colors.grey.shade400,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            padding: EdgeInsets.symmetric(vertical: 14.h),
          ),
          onPressed: selectedContacts.isNotEmpty
              ? () {
                  // TODO: Handle create group
                }
              : null,
          child: Text(
            "Create Group (${selectedContacts.length} members)",
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
