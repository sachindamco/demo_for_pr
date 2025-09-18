import 'package:flutter/material.dart';
import '../../../widgets/custom_event_card.dart';
import '../models/event_card_item_model.dart';

class EventCardItem extends StatelessWidget {
  final EventCardItemModel eventCardItemModel;
  final VoidCallback? onInfoTap;
  final VoidCallback? onPrimaryButtonTap;
  final VoidCallback? onSecondaryButtonTap;

  EventCardItem({
    Key? key,
    required this.eventCardItemModel,
    this.onInfoTap,
    this.onPrimaryButtonTap,
    this.onSecondaryButtonTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomEventCard(
      imagePath: eventCardItemModel.imagePath ?? '',
      title: eventCardItemModel.title ?? '',
      location: eventCardItemModel.location ?? '',
      dateTime: eventCardItemModel.dateTime ?? '',
      statusBadgeText: eventCardItemModel.statusBadgeText ?? '',
      primaryButtonText: eventCardItemModel.primaryButtonText ?? '',
      secondaryButtonText: eventCardItemModel.secondaryButtonText ?? '',
      onInfoTap: onInfoTap,
      onPrimaryButtonTap: onPrimaryButtonTap,
      onSecondaryButtonTap: onSecondaryButtonTap,
    );
  }
}
