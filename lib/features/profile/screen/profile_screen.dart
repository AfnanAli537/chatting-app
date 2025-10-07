import 'package:chatting_app/core/utils/app_colors.dart';
import 'package:chatting_app/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.profile)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildProfileHeader(theme, textTheme),
            const SizedBox(height: 24),
            _buildStatsRow(theme, textTheme, colorScheme),
            const SizedBox(height: 24),
            _buildAccountSection(theme, textTheme, colorScheme),
            const SizedBox(height: 16),
            _buildPrivacySection(theme, textTheme, colorScheme),
            const SizedBox(height: 16),
            _buildSettingsButton(theme),
            const SizedBox(height: 12),
            _buildSignOutButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader(ThemeData theme, TextTheme textTheme) {
    return Column(
      children: [
        Stack(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage("https://via.placeholder.com/150"),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: theme.primaryColor,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: theme.scaffoldBackgroundColor,
                    width: 2,
                  ),
                ),
                child: Icon(
                  Icons.edit,
                  size: 16,
                  color: theme.colorScheme.onPrimary,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text("Heba", style: textTheme.displaySmall),
        const SizedBox(height: 4),
        Text(
          "heba@gmail.com",
          style: textTheme.bodyMedium?.copyWith(
            color: textTheme.bodySmall?.color,
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }

  Widget _buildStatsRow(
    ThemeData theme,
    TextTheme textTheme,
    ColorScheme colorScheme,
  ) {
    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            theme,
            textTheme,
            colorScheme,
            Icons.people_outline,
            "2",
            AppStrings.contacts,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildStatCard(
            theme,
            textTheme,
            colorScheme,
            Icons.person_add,
            "2",
            AppStrings.requests,
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard(
    ThemeData theme,
    TextTheme textTheme,
    ColorScheme colorScheme,
    IconData icon,
    String number,
    String label,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          children: [
            Icon(icon, size: 28, color: theme.primaryColor),
            const SizedBox(height: 8),
            Text(number, style: textTheme.headlineMedium),
            const SizedBox(height: 4),
            Text(label, style: textTheme.bodySmall),
          ],
        ),
      ),
    );
  }

  Widget _buildAccountSection(
    ThemeData theme,
    TextTheme textTheme,
    ColorScheme colorScheme,
  ) {
    return _buildSection(
      theme,
      textTheme,
      colorScheme,
      title: AppStrings.accountInformation,
      icon: Icons.person_outline,
      children: [
        _buildInfoTile(
          theme,
          textTheme,
          colorScheme,
          Icons.badge,
          AppStrings.username,
          "heba",
        ),
        Divider(height: 1, color: theme.dividerTheme.color),
        _buildInfoTile(
          theme,
          textTheme,
          colorScheme,
          Icons.email_outlined,
          AppStrings.email,
          "heba@gmail.com",
        ),
        Divider(height: 1, color: theme.dividerTheme.color),
        _buildInfoTile(
          theme,
          textTheme,
          colorScheme,
          Icons.info_outline,
          AppStrings.about,
          "Software Developer",
        ),
      ],
    );
  }

  Widget _buildPrivacySection(
    ThemeData theme,
    TextTheme textTheme,
    ColorScheme colorScheme,
  ) {
    return _buildSection(
      theme,
      textTheme,
      colorScheme,
      title: AppStrings.privacySecurity,
      icon: Icons.shield_outlined,
      children: [
        _buildInfoTile(
          theme,
          textTheme,
          colorScheme,
          Icons.lock_outline,
          AppStrings.endToEndEncryption,
          AppStrings.allMessagesEncrypted,
          active: true,
        ),
        Divider(height: 1, color: theme.dividerTheme.color),
        _buildInfoTile(
          theme,
          textTheme,
          colorScheme,
          Icons.people_alt_outlined,
          AppStrings.friendRequestsOnly,
          AppStrings.privacyProtectionEnabled,
          active: true,
        ),
      ],
    );
  }

  Widget _buildSection(
    ThemeData theme,
    TextTheme textTheme,
    ColorScheme colorScheme, {
    required String title,
    required IconData icon,
    required List<Widget> children,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 20, color: theme.primaryColor),
                const SizedBox(width: 8),
                Text(title, style: textTheme.titleLarge),
              ],
            ),
            const SizedBox(height: 12),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildInfoTile(
    ThemeData theme,
    TextTheme textTheme,
    ColorScheme colorScheme,
    IconData icon,
    String title,
    String subtitle, {
    bool active = false,
  }) {
    final iconColor = active ? AppColors.success : textTheme.bodySmall?.color;
    final backgroundColor = active
        ? AppColors.success.withOpacity(0.1)
        : colorScheme.surfaceContainerHighest;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: textTheme.titleMedium),
                const SizedBox(height: 2),
                Text(subtitle, style: textTheme.bodySmall),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsButton(ThemeData theme) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _showSettingsBottomSheet,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.settings_outlined),
            SizedBox(width: 8),
            Text(AppStrings.settingsPrivacy),
          ],
        ),
      ),
    );
  }

  Widget _buildSignOutButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.redColor,
          foregroundColor: AppColors.white,
        ),
        onPressed: _handleSignOut,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.logout),
            SizedBox(width: 8),
            Text(AppStrings.signOut),
          ],
        ),
      ),
    );
  }

  void _showSettingsBottomSheet() {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => StatefulBuilder(
        builder: (context, setModalState) => Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(AppStrings.settings, style: textTheme.headlineMedium),
              const SizedBox(height: 20),

              // Theme
              Card(
                margin: EdgeInsets.zero,
                child: ListTile(
                  leading: Icon(
                    _isDarkMode ? Icons.dark_mode : Icons.light_mode,
                    color: theme.primaryColor,
                  ),
                  title: Text(
                    AppStrings.darkMode,
                    style: textTheme.titleMedium,
                  ),
                  subtitle: Text(
                    _isDarkMode
                        ? AppStrings.darkThemeEnabled
                        : AppStrings.lightThemeEnabled,
                    style: textTheme.bodySmall,
                  ),
                  trailing: Switch(
                    value: _isDarkMode,
                    onChanged: (value) {
                      setModalState(() => _isDarkMode = value);
                      setState(() => _isDarkMode = value);
                      // TODO: Implement actual theme switching with Provider/Bloc
                    },
                  ),
                ),
              ),
              const SizedBox(height: 12),
              // About & Licenses
              Card(
                margin: EdgeInsets.zero,
                child: ListTile(
                  leading: Icon(Icons.info_outline, color: theme.primaryColor),
                  title: Text(
                    AppStrings.language,
                    style: textTheme.titleMedium,
                  ),
                  subtitle: Text(
                    AppStrings.chooseYourLanguage,
                    style: textTheme.bodySmall,
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {},
                ),
              ),
              const SizedBox(height: 20),
              // About & Licenses
              Card(
                margin: EdgeInsets.zero,
                child: ListTile(
                  leading: Icon(Icons.info_outline, color: theme.primaryColor),
                  title: Text(
                    AppStrings.aboutLicenses,
                    style: textTheme.titleMedium,
                  ),
                  subtitle: Text(
                    AppStrings.viewAppInfoLicenses,
                    style: textTheme.bodySmall,
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {},
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  void _handleSignOut() {
    final textTheme = Theme.of(context).textTheme;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(AppStrings.signOut, style: textTheme.titleLarge),
        content: Text(
          AppStrings.signOutConfirmation,
          style: textTheme.bodyMedium,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(AppStrings.cancel),
          ),
          TextButton(
            onPressed: () {
              // TODO: Implement sign out logic
              Navigator.pop(context);
            },
            child: const Text(
              AppStrings.signOut,
              style: TextStyle(color: AppColors.redColor),
            ),
          ),
        ],
      ),
    );
  }
}
