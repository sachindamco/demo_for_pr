import '../../../core/app_export.dart';
import './category_chip_item_model.dart';
import './event_card_item_model.dart';

class EventsDiscoveryModel extends Equatable {
  EventsDiscoveryModel({
    this.categories,
    this.eventCards,
  });

  List<CategoryChipItemModel>? categories;
  List<EventCardItemModel>? eventCards;

  EventsDiscoveryModel copyWith({
    List<CategoryChipItemModel>? categories,
    List<EventCardItemModel>? eventCards,
  }) {
    return EventsDiscoveryModel(
      categories: categories ?? this.categories,
      eventCards: eventCards ?? this.eventCards,
    );
  }

  @override
  List<Object?> get props => [categories, eventCards];
}
