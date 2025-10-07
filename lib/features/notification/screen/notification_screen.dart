import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final List<NotificationItem> notifications = [
    NotificationItem(
      type: NotificationType.groupCreated,
      title: 'Group Created',
      description: 'You created the group "Design Team"',
      time: '1 day ago',
      userAvatar: null,
    ),
    NotificationItem(
      type: NotificationType.addedToGroup,
      title: 'Added to Group',
      description: 'John added you to "Weekend Plans"',
      time: '2 days ago',
      userAvatar: null,
    ),
    NotificationItem(
      type: NotificationType.friendRequest,
      title: 'Friend Request',
      description: 'Alex Garcia sent you a friend request',
      time: 'about 1 hour ago',
      userAvatar: 'alex_garcia',
    ),
  ];

  final List<FriendRequest> friendRequests = [
    FriendRequest(username: 'alex_garcia', displayName: 'Alex Garcia'),
    FriendRequest(username: 'lily_chen', displayName: 'Lily Chen'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Stay updated with all your activities',
                style: TextStyle(color: Colors.grey[600], fontSize: 14),
              ),
            ),
            const SizedBox(height: 18),

            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Mark all as read functionality
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text('Mark all as read'),
              ),
            ),
            const SizedBox(height: 18),

            // Recent Activity Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                'Recent Activity',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),

            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                return _buildNotificationItem(notifications[index]);
              },
            ),

            // Friend Requests Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Text(
                'Friend Requests',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),

            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: friendRequests.length,
              itemBuilder: (context, index) {
                return _buildFriendRequestItem(friendRequests[index]);
              },
            ),

            SizedBox(height: 80), // Space for bottom navigation
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationItem(NotificationItem notification) {
    IconData iconData;
    Color iconColor;

    switch (notification.type) {
      case NotificationType.groupCreated:
        iconData = Icons.group;
        iconColor = Colors.green;
        break;
      case NotificationType.addedToGroup:
        iconData = Icons.group_add;
        iconColor = Colors.blue;
        break;
      case NotificationType.friendRequest:
        iconData = Icons.person_add;
        iconColor = Colors.orange;
        break;
    }

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 2, offset: Offset(0, 1)),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(iconData, color: iconColor, size: 20),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                SizedBox(height: 2),
                Text(
                  notification.description,
                  style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                ),
                SizedBox(height: 4),
                Text(
                  notification.time,
                  style: TextStyle(fontSize: 10, color: Colors.grey[500]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFriendRequestItem(FriendRequest request) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 2, offset: Offset(0, 1)),
        ],
      ),
      child: Row(
        children: [
          // User avatar placeholder
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.person, color: Colors.grey[600]),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  request.username,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                SizedBox(height: 2),
                Text(
                  'wants to be friends',
                  style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                ),
              ],
            ),
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  // Accept friend request
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),

                child: Row(
                  children: [
                    Icon(Icons.check, size: 16),
                    SizedBox(width: 4),
                    Text('Accept'),
                  ],
                ),
              ),
              SizedBox(width: 8),
              IconButton(
                onPressed: () {
                  // Decline friend request
                },
                icon: Icon(Icons.close, color: Colors.grey),
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

enum NotificationType { groupCreated, addedToGroup, friendRequest }

class NotificationItem {
  final NotificationType type;
  final String title;
  final String description;
  final String time;
  final String? userAvatar;

  NotificationItem({
    required this.type,
    required this.title,
    required this.description,
    required this.time,
    this.userAvatar,
  });
}

class FriendRequest {
  final String username;
  final String displayName;

  FriendRequest({required this.username, required this.displayName});
}
