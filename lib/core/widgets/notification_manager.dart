import 'dart:async';
import 'package:chatting_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class NotificationManager {
  static final List<OverlayEntry> _notifications = [];
  static const int _maxVisibleNotifications = 3;
  static const double _cardHeight = 70.0;
  static const double _cardOverlap = 15.0;
  static const double _hiddenCardVisibleHeight = 8.0;

  /// Show a notification card with the given message
  static void show(BuildContext context, String message) {
    final overlay = Overlay.of(context);

    late OverlayEntry entry;

    entry = OverlayEntry(
      builder: (context) {
        final index = _notifications.indexOf(entry);
        final isFullyVisible = index < _maxVisibleNotifications;
        final isPartiallyVisible = index == _maxVisibleNotifications;

        return Positioned(
          top: 40.0 + (index * (_cardHeight - _cardOverlap)),
          left: 20,
          right: 20,
          child: AnimatedOpacity(
            opacity: isFullyVisible ? 1.0 : (isPartiallyVisible ? 0.3 : 0.0),
            duration: const Duration(milliseconds: 300),
            child: Transform(
              transform: Matrix4.identity()
                ..translate(
                  0.0,
                  isFullyVisible ? 0.0 : (isPartiallyVisible ? 10.0 : 20.0),
                )
                ..scale(
                  isFullyVisible ? 1.0 : (isPartiallyVisible ? 0.98 : 0.95),
                ),
              child: Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.horizontal,
                onDismissed: (_) => _remove(entry),
                child: _NotificationCard(
                  message: message,
                  index: index,
                  totalCount: _notifications.length,
                  isFullyVisible: isFullyVisible,
                  isPartiallyVisible: isPartiallyVisible,
                ),
              ),
            ),
          ),
        );
      },
    );

    _notifications.insert(0, entry);
    overlay.insert(entry);

    Timer(const Duration(seconds: 3), () {
      if (_notifications.contains(entry)) {
        _remove(entry);
      }
    });

    _updatePositions();
  }

  static void _remove(OverlayEntry entry) {
    if (!_notifications.contains(entry)) return;
    entry.remove();
    _notifications.remove(entry);
    _updatePositions();
  }

  static void _updatePositions() {
    for (final entry in _notifications) {
      entry.markNeedsBuild();
    }
  }
}

class _NotificationCard extends StatelessWidget {
  final String message;
  final int index;
  final int totalCount;
  final bool isFullyVisible;
  final bool isPartiallyVisible;

  const _NotificationCard({
    required this.message,
    required this.index,
    required this.totalCount,
    required this.isFullyVisible,
    required this.isPartiallyVisible,
  });

  @override
  Widget build(BuildContext context) {
    final isTopCard = index == 0;

    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          // Background shadow for depth effect (only on fully visible cards)
          if (isFullyVisible)
            Positioned(
              top: 2,
              left: 2,
              right: 2,
              bottom: -2,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withOpacity(0.1),
                      blurRadius: 6,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
              ),
            ),

          // Main card with conditional height for partially visible cards
          Container(
            height: isPartiallyVisible
                ? NotificationManager._hiddenCardVisibleHeight
                : NotificationManager._cardHeight,
            decoration: BoxDecoration(
              color: isPartiallyVisible ? AppColors.grey400 : AppColors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: isPartiallyVisible
                    ? AppColors.grey500
                    : AppColors.grey200,
                width: 1,
              ),
              boxShadow: isFullyVisible
                  ? [
                      BoxShadow(
                        color: AppColors.black.withOpacity(0.05),
                        blurRadius: 3,
                        offset: const Offset(0, 1),
                      ),
                    ]
                  : null,
            ),
            child: isFullyVisible
                ? Row(
                    children: [
                      const SizedBox(width: 16),
                      const Icon(
                        Icons.notifications_none,
                        color: AppColors.black,
                        size: 22,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          message,
                          style: const TextStyle(
                            color: AppColors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 16),
                    ],
                  )
                : null,
          ),

          // Badge showing total notifications if this is the top card
          if (isTopCard &&
              totalCount > NotificationManager._maxVisibleNotifications)
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  '+${totalCount - NotificationManager._maxVisibleNotifications}',
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
    );
  }
}
