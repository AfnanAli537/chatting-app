class AppStrings {
  // Private constructor to prevent instantiation
  AppStrings._();

  // Profile Screen
  static const String profile = "Profile";
  static const String contacts = "Contacts";
  static const String requests = "Requests";
  static const String accountInformation = "Account Information";
  static const String username = "Username";
  static const String email = "Email";
  static const String about = "About";
  static const String privacySecurity = "Privacy & Security";
  static const String endToEndEncryption = "End-to-End Encryption";
  static const String allMessagesEncrypted = "All messages are encrypted";
  static const String friendRequestsOnly = "Friend Requests Only";
  static const String privacyProtectionEnabled = "Privacy protection enabled";
  static const String settingsPrivacy = "Settings & Privacy";
  static const String signOut = "Sign Out";
  
  // Settings Bottom Sheet
  static const String settings = "Settings";
  static const String darkMode = "Dark Mode";
  static const String darkThemeEnabled = "Dark theme enabled";
  static const String lightThemeEnabled = "Light theme enabled";
  static const String aboutLicenses = "About & Licenses";
  static const String viewAppInfoLicenses = "View app info and open source licenses";
  
  // Sign Out Dialog
  static const String signOutConfirmation = "Are you sure you want to sign out?";
  static const String cancel = "Cancel";
  // Language Selection
  static const String language = 'Language';
  static const String chooseLanguage = 'Choose Language';
  static const String chooseYourLanguage = 'Choose your preferred language';
  static const String save = 'Save';




  // Explore Screen
  static const String explore = 'Explore';
  static const String searchForUsers = 'Search for users by their username';
  static const String enterUsername = 'Enter username...';
  static const String searchToAddFriend = 'Search to add friend';
  static const String userNotFound = 'User not found';
  static const String add = 'Add';
  
  // Dynamic strings with parameters
  static String friendRequestSent(String username) => 
      'Friend request sent to $username';
  static String friendRequestCanceled(String username) => 
      'Friend request to $username canceled';

  // Notifications Screen
  static const String notifications = 'Notifications';
  static const String stayUpdated = 'Stay updated with all your activities';
  static const String markAllAsRead = 'Mark all as read';
  static const String recentActivity = 'Recent Activity';
  static const String friendRequests = 'Friend Requests';
  static const String unreadMessages = 'Unread Messages';
  static const String wantsToBeFriends = 'wants to be friends';
  static const String accept = 'Accept';
  
  // Notification Types
  static const String groupCreated = 'Group Created';
  static const String addedToGroup = 'Added to Group';
  static const String friendRequest = 'Friend Request';
  static const String newMessage = 'New Message';
  
  // Notification Descriptions
  static String groupCreatedDesc(String groupName) => 
      'You created the group "$groupName"';
  static String addedToGroupDesc(String userName, String groupName) => 
      '$userName added you to "$groupName"';
  static String friendRequestDesc(String userName) => 
      '$userName sent you a friend request';
  static String newMessageDesc(String userName) => 
      'New message from $userName';
  // Notification Action Messages
  static const String allNotificationsMarkedRead = 'All notifications marked as read';
  static const String notificationMarkedRead = 'Notification marked as read';
  static String friendRequestAccepted(String username) => 
      'Friend request from $username accepted';
  static String friendRequestDeclined(String username) => 
      'Friend request from $username declined';
  // Time Strings
  static const String oneDayAgo = '1 day ago';
  static const String twoDaysAgo = '2 days ago';
  static const String aboutOneHourAgo = 'about 1 hour ago';
  static const String aboutFourHoursAgo = 'about 4 hours ago';
  static const String justNow = 'just now';
}
