import '../../../core/app_export.dart';

class EventCardItemModel extends Equatable {
  EventCardItemModel({
    this.imagePath,
    this.title,
    this.location,
    this.dateTime,
    this.statusBadgeText,
    this.primaryButtonText,
    this.secondaryButtonText,
  }) {
    imagePath = imagePath ?? '';
    title = title ?? '';
    location = location ?? '';
    dateTime = dateTime ?? '';
    statusBadgeText = statusBadgeText ?? '';
    primaryButtonText = primaryButtonText ?? '';
    secondaryButtonText = secondaryButtonText ?? '';
  }

  String? imagePath;
  String? title;
  String? location;
  String? dateTime;
  String? statusBadgeText;
  String? primaryButtonText;
  String? secondaryButtonText;

  EventCardItemModel copyWith({
    String? imagePath,
    String? title,
    String? location,
    String? dateTime,
    String? statusBadgeText,
    String? primaryButtonText,
    String? secondaryButtonText,
  }) {
    return EventCardItemModel(
      imagePath: imagePath ?? this.imagePath,
      title: title ?? this.title,
      location: location ?? this.location,
      dateTime: dateTime ?? this.dateTime,
      statusBadgeText: statusBadgeText ?? this.statusBadgeText,
      primaryButtonText: primaryButtonText ?? this.primaryButtonText,
      secondaryButtonText: secondaryButtonText ?? this.secondaryButtonText,
    );
  }

  @override
  List<Object?> get props => [
        imagePath,
        title,
        location,
        dateTime,
        statusBadgeText,
        primaryButtonText,
        secondaryButtonText,
      ];
}
