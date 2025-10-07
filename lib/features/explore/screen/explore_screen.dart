import 'package:flutter/material.dart';
import 'package:chatting_app/core/widgets/notification_manager.dart';
import 'package:chatting_app/core/utils/app_strings.dart';
import 'package:chatting_app/core/utils/app_colors.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final TextEditingController _searchController = TextEditingController();

  final List<String> _allUsers = [
    'Afnan',
    'Alaa',
    'Heba',
    'Malak',
    'Mariam',
    'Marwan',
    'Mohamed',
  ];

  List<String> _filteredUsers = [];
  final Set<String> _addedFriends = {};

  @override
  void initState() {
    super.initState();
    _filteredUsers = [];
    _searchController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _searchUser() {
    final query = _searchController.text.trim();

    if (query.isEmpty) {
      setState(() => _filteredUsers = []);
      NotificationManager.show(context, AppStrings.searchToAddFriend);
      return;
    }

    setState(() {
      _filteredUsers = _allUsers
          .where((user) => user.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });

    if (_filteredUsers.isEmpty) {
      NotificationManager.show(context, AppStrings.userNotFound);
    }
  }

  void _toggleFriend(String user) {
    setState(() {
      if (_addedFriends.contains(user)) {
        _addedFriends.remove(user);
        NotificationManager.show(
          context,
          AppStrings.friendRequestCanceled(user),
        );
      } else {
        _addedFriends.add(user);
        NotificationManager.show(context, AppStrings.friendRequestSent(user));
      }
    });
  }

  void _clearSearch() {
    _searchController.clear();
    setState(() => _filteredUsers = []);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          AppStrings.explore,
          style: textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.black, 
          ),
        ),
        backgroundColor: theme.appBarTheme.backgroundColor,
        centerTitle: true,
        elevation: 0.5,
        iconTheme: const IconThemeData(
          color: AppColors.black,
        ), 
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                AppStrings.searchForUsers,
                style: textTheme.bodyMedium?.copyWith(color: AppColors.grey600),
              ),
            ),
            const SizedBox(height: 8),

            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    onSubmitted: (_) => _searchUser(),
                    decoration: InputDecoration(
                      hintText: AppStrings.enterUsername,
                      hintStyle: const TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: theme.inputDecorationTheme.fillColor,
                      suffixIcon: _searchController.text.isNotEmpty
                          ? IconButton(
                              icon: const Icon(
                                Icons.close,
                                color: AppColors.black,
                              ),
                              onPressed: _clearSearch,
                            )
                          : null,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: AppColors.black,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: AppColors.backgroundDark,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: AppColors.black,
                        ),
                      ),
                      contentPadding: theme.inputDecorationTheme.contentPadding,
                    ),
                    style: textTheme.bodyMedium?.copyWith(
                      color: AppColors.black,
                    ),
                    onTapOutside: (_) => FocusScope.of(context).unfocus(),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.search,
                      color: AppColors.white,
                    ),
                    onPressed: _searchUser,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            Expanded(
              child: _filteredUsers.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.search,
                            size: 80,
                            color: AppColors.grey400,
                          ),
                          Text(
                            AppStrings.searchToAddFriend,
                            style: textTheme.bodyMedium?.copyWith(
                              color: theme.hintColor,
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: _filteredUsers.length,
                      itemBuilder: (context, index) {
                        final user = _filteredUsers[index];
                        final isAdded = _addedFriends.contains(user);

                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                            color: theme.cardTheme.color,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: theme.dividerTheme.color ?? Colors.grey,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: theme.shadowColor.withOpacity(0.05),
                                blurRadius: 3,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor:
                                  AppColors.black,
                              child: const Icon(
                                Icons.person,
                                color: AppColors
                                    .white,
                              ),
                            ),
                            title: Text(
                              user,
                              style: textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: AppColors.black,
                              ),
                            ),
                            trailing: GestureDetector(
                              onTap: () => _toggleFriend(user),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: isAdded
                                      ? AppColors
                                            .white
                                      : AppColors
                                            .black,
                                  border: Border.all(
                                    color: AppColors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  isAdded ? AppStrings.cancel : AppStrings.add,
                                  style: textTheme.labelMedium?.copyWith(
                                    color: isAdded
                                        ? AppColors
                                              .black
                                        : AppColors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
