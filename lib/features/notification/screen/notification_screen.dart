import 'package:flutter/material.dart';
import 'package:chatting_app/core/utils/app_strings.dart';
import 'package:chatting_app/core/utils/app_colors.dart';
import 'package:chatting_app/core/widgets/notification_manager.dart';

class NotificationsScreen extends StatefulWidget {
  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final List<String> _allUsers = [
    'Afnan',
    'Alaa',
    'Heba',
    'Malak',
    'Mariam',
    'Marwan',
    'Mohamed',
    'John',
    'Alex Garcia',
    'Alice Smith',
    'Sarah Wilson',
  ];

  final List<NotificationItem> _notifications = [
    NotificationItem(
      type: NotificationType.addedToGroup,
      title: AppStrings.addedToGroup,
      description: AppStrings.addedToGroupDesc('John', 'Weekend Plans'),
      time: AppStrings.twoDaysAgo,
      userAvatar: null,
      isRead: false,
    ),
    NotificationItem(
      type: NotificationType.friendRequest,
      title: AppStrings.friendRequest,
      description: AppStrings.friendRequestDesc('Alex Garcia'),
      time: AppStrings.aboutFourHoursAgo,
      userAvatar: 'alex_garcia',
      isRead: false,
    ),
  ];

  final List<FriendRequest> _friendRequests = [
    FriendRequest(username: 'alex_garcia', displayName: 'Alex Garcia'),
    FriendRequest(username: 'lily_chen', displayName: 'Lily Chen'),
    FriendRequest(username: 'arcepi', displayName: 'Arcepi'),
  ];

  final List<UnreadMessage> _unreadMessages = [
    UnreadMessage(
      username: 'alice_smith',
      displayName: 'Alice Smith',
      message: 'Hey! How are you doing?',
      time: '5 min ago',
      unreadCount: 3,
    ),
    UnreadMessage(
      username: 'sarah_wilson',
      displayName: 'Sarah Wilson',
      message: 'Are we still meeting tomorrow?',
      time: '1 hour ago',
      unreadCount: 1,
    ),
    UnreadMessage(
      username: 'design_team',
      displayName: 'Design Team',
      message: 'alice_smith: Great work on the new mockups everyone!',
      time: '2 hours ago',
      unreadCount: 5,
    ),
  ];

  void _markAllAsRead() {
    setState(() {
      // Only mark recent activity notifications as read
      for (var notification in _notifications) {
        notification.isRead = true;
      }
      // Unread messages remain unread (red badges stay)
    });

    // Show success notification
    NotificationManager.show(context, AppStrings.allNotificationsMarkedRead);
  }

  void _acceptFriendRequest(FriendRequest request) {
    setState(() {
      _friendRequests.remove(request);
    });

    // Show success notification
    NotificationManager.show(
      context,
      AppStrings.friendRequestAccepted(request.displayName),
    );

    // TODO: Implement actual friend request acceptance
  }

  void _declineFriendRequest(FriendRequest request) {
    setState(() {
      _friendRequests.remove(request);
    });

    // Show success notification
    NotificationManager.show(
      context,
      AppStrings.friendRequestDeclined(request.displayName),
    );

    // TODO: Implement actual friend request decline
  }

  void _markNotificationAsRead(NotificationItem notification) {
    if (!notification.isRead) {
      setState(() {
        notification.isRead = true;
      });

      // Show success notification for individual read
      NotificationManager.show(context, AppStrings.notificationMarkedRead);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          AppStrings.notifications,
          style: const TextStyle(
            color: AppColors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: AppColors.white,
        elevation: 0.5,
        centerTitle: true,
        iconTheme: const IconThemeData(color: AppColors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            _buildHeaderSection(),

            // Recent Activity Section
            _buildSectionHeader(AppStrings.recentActivity),

            // Notifications List
            _buildNotificationsList(),

            // Friend Requests Section
            if (_friendRequests.isNotEmpty)
              _buildSectionHeader(AppStrings.friendRequests),

            // Friend Requests List
            if (_friendRequests.isNotEmpty) _buildFriendRequestsList(),

            // Unread Messages Section
            if (_unreadMessages.isNotEmpty)
              _buildSectionHeader(AppStrings.unreadMessages),

            // Unread Messages List
            if (_unreadMessages.isNotEmpty) _buildUnreadMessagesList(),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Column(
          children: [
            Text(
              AppStrings.stayUpdated,
              style: const TextStyle(color: AppColors.grey600, fontSize: 14),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _markAllAsRead,
              style: ElevatedButton.styleFrom(
                foregroundColor: AppColors.black,
                backgroundColor: AppColors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 8,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: const BorderSide(color: AppColors.black),
                ),
              ),
              child: const Text('Mark all as read'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        title,
        style: const TextStyle(
          color: AppColors.black,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }

  Widget _buildNotificationsList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _notifications.length,
      itemBuilder: (context, index) {
        return _buildNotificationItem(_notifications[index]);
      },
    );
  }

  Widget _buildFriendRequestsList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _friendRequests.length,
      itemBuilder: (context, index) {
        return _buildFriendRequestItem(_friendRequests[index]);
      },
    );
  }

  Widget _buildUnreadMessagesList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _unreadMessages.length,
      itemBuilder: (context, index) {
        return _buildUnreadMessageItem(_unreadMessages[index]);
      },
    );
  }

  Widget _buildNotificationItem(NotificationItem notification) {
    final iconData = _getNotificationIcon(notification.type);
    final iconColor = _getNotificationColor(notification.type);

    // Use grey colors for read notifications, normal colors for unread
    final titleColor = notification.isRead
        ? AppColors.grey500
        : AppColors.black;
    final descriptionColor = notification.isRead
        ? AppColors.grey400
        : AppColors.grey700;
    final timeColor = notification.isRead
        ? AppColors.grey300
        : AppColors.grey500;

    return GestureDetector(
      onTap: () => _markNotificationAsRead(notification),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.grey200),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.05),
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: iconColor.withOpacity(notification.isRead ? 0.05 : 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                iconData,
                color: notification.isRead ? AppColors.grey400 : iconColor,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notification.title,
                    style: TextStyle(
                      color: titleColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    notification.description,
                    style: TextStyle(color: descriptionColor, fontSize: 12),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    notification.time,
                    style: TextStyle(color: timeColor, fontSize: 10),
                  ),
                ],
              ),
            ),
            if (!notification.isRead)
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: AppColors.blueColor,
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildFriendRequestItem(FriendRequest request) {
    // Check if this user exists in our explore list
    final displayName = _allUsers.contains(request.displayName)
        ? request.displayName
        : request.username;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.grey200),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.05),
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              color: AppColors.grey300,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.person, color: AppColors.grey600),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  displayName,
                  style: const TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 2),
                const Text(
                  'wants to be friends',
                  style: TextStyle(color: AppColors.grey700, fontSize: 12),
                ),
              ],
            ),
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () => _acceptFriendRequest(request),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.black,
                  foregroundColor: AppColors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.check, size: 16),
                    SizedBox(width: 4),
                    Text('Accept'),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              TextButton(
                onPressed: () => _declineFriendRequest(request),
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.grey600,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                ),
                child: const Text(
                  'Decline',
                  style: TextStyle(
                    color: AppColors.grey600,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildUnreadMessageItem(UnreadMessage message) {
    // Check if this user exists in our explore list
    final displayName = _allUsers.contains(message.displayName)
        ? message.displayName
        : message.username;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.grey200),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.05),
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              color: AppColors.grey300,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.person, color: AppColors.grey600),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        displayName,
                        style: const TextStyle(
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    if (message.unreadCount > 0)
                      Container(
                        width: 20,
                        height: 20,
                        decoration: const BoxDecoration(
                          color: AppColors.redColor,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            message.unreadCount.toString(),
                            style: const TextStyle(
                              color: AppColors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  message.message,
                  style: const TextStyle(
                    color: AppColors.grey700,
                    fontSize: 12,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  message.time,
                  style: const TextStyle(
                    color: AppColors.grey500,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  IconData _getNotificationIcon(NotificationType type) {
    switch (type) {
      case NotificationType.groupCreated:
        return Icons.group;
      case NotificationType.addedToGroup:
        return Icons.group_add;
      case NotificationType.friendRequest:
        return Icons.person_add;
      case NotificationType.message:
        return Icons.message;
    }
  }

  Color _getNotificationColor(NotificationType type) {
    switch (type) {
      case NotificationType.groupCreated:
        return AppColors.greenColor;
      case NotificationType.addedToGroup:
        return AppColors.blueColor;
      case NotificationType.friendRequest:
        return AppColors.secondaryDark;
      case NotificationType.message:
        return AppColors.black;
    }
  }
}

enum NotificationType { groupCreated, addedToGroup, friendRequest, message }

class NotificationItem {
  final NotificationType type;
  final String title;
  final String description;
  final String time;
  final String? userAvatar;
  bool isRead;

  NotificationItem({
    required this.type,
    required this.title,
    required this.description,
    required this.time,
    this.userAvatar,
    required this.isRead,
  });
}

class FriendRequest {
  final String username;
  final String displayName;

  FriendRequest({required this.username, required this.displayName});
}

class UnreadMessage {
  final String username;
  final String displayName;
  final String message;
  final String time;
  int unreadCount;

  UnreadMessage({
    required this.username,
    required this.displayName,
    required this.message,
    required this.time,
    required this.unreadCount,
  });
}
