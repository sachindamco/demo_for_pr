import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../models/category_chip_item_model.dart';
import '../models/event_card_item_model.dart';
import '../models/events_discovery_model.dart';

part 'events_discovery_event.dart';
part 'events_discovery_state.dart';

class EventsDiscoveryBloc
    extends Bloc<EventsDiscoveryEvent, EventsDiscoveryState> {
  EventsDiscoveryBloc(EventsDiscoveryState initialState) : super(initialState) {
    on<EventsDiscoveryInitialEvent>(_onInitialize);
    on<MenuTappedEvent>(_onMenuTapped);
    on<SearchTappedEvent>(_onSearchTapped);
    on<NotificationTappedEvent>(_onNotificationTapped);
    on<CategorySelectedEvent>(_onCategorySelected);
    on<EventInfoTappedEvent>(_onEventInfoTapped);
    on<EventPrimaryButtonTappedEvent>(_onEventPrimaryButtonTapped);
    on<EventSecondaryButtonTappedEvent>(_onEventSecondaryButtonTapped);
    on<BottomNavigationItemTappedEvent>(_onBottomNavigationItemTapped);
    on<FloatingButtonTappedEvent>(_onFloatingButtonTapped);
    on<BottomBarInfoTappedEvent>(_onBottomBarInfoTapped);
  }

  _onInitialize(
    EventsDiscoveryInitialEvent event,
    Emitter<EventsDiscoveryState> emit,
  ) async {
    List<CategoryChipItemModel> categories = [
      CategoryChipItemModel(
        iconPath: ImageConstant.imgStarIcon,
        text: 'All Events',
        isSelected: true,
      ),
      CategoryChipItemModel(
        iconPath: ImageConstant.imgAdventure2Icon,
        text: 'Adventure',
        isSelected: false,
      ),
      CategoryChipItemModel(
        iconPath: ImageConstant.imgEventsIcon,
        text: 'Comedy',
        isSelected: false,
      ),
      CategoryChipItemModel(
        iconPath: ImageConstant.imgMusic2Icon,
        text: 'Music',
        isSelected: false,
      ),
      CategoryChipItemModel(
        iconPath: ImageConstant.imgArtIcon,
        text: 'Theatre & Arts',
        isSelected: false,
        width: 110.h,
        textAlignment: TextAlign.center,
      ),
    ];

    List<EventCardItemModel> eventCards = [
      EventCardItemModel(
        imagePath: ImageConstant.imgImage,
        title: 'Rhythm with A.R. Rahman',
        location: 'Auditorium',
        dateTime: 'Mon 08 Sep, 08:30PM',
        statusBadgeText: 'FILLING FAST',
        primaryButtonText: 'Book Now',
        secondaryButtonText: 'View Details',
      ),
      EventCardItemModel(
        imagePath: ImageConstant.imgImage184x380,
        title: 'Rhythm with Karan',
        location: 'Auditorium',
        dateTime: 'Mon 08 Sep, 08:30PM',
        statusBadgeText: 'SOLD OUT',
        primaryButtonText: 'Join Waitlist',
        secondaryButtonText: 'View Details',
      ),
    ];

    emit(state.copyWith(
      eventsDiscoveryModel: state.eventsDiscoveryModel?.copyWith(
        categories: categories,
        eventCards: eventCards,
      ),
      selectedBottomBarIndex: 3,
    ));
  }

  _onMenuTapped(
    MenuTappedEvent event,
    Emitter<EventsDiscoveryState> emit,
  ) async {
    // Handle menu tap
  }

  _onSearchTapped(
    SearchTappedEvent event,
    Emitter<EventsDiscoveryState> emit,
  ) async {
    // Handle search tap
  }

  _onNotificationTapped(
    NotificationTappedEvent event,
    Emitter<EventsDiscoveryState> emit,
  ) async {
    // Handle notification tap
  }

  _onCategorySelected(
    CategorySelectedEvent event,
    Emitter<EventsDiscoveryState> emit,
  ) async {
    List<CategoryChipItemModel> updatedCategories =
        state.eventsDiscoveryModel?.categories?.map((category) {
              return category.copyWith(isSelected: false);
            }).toList() ??
            [];

    if (event.index < updatedCategories.length) {
      updatedCategories[event.index] =
          updatedCategories[event.index].copyWith(isSelected: true);
    }

    emit(state.copyWith(
      eventsDiscoveryModel: state.eventsDiscoveryModel?.copyWith(
        categories: updatedCategories,
      ),
    ));
  }

  _onEventInfoTapped(
    EventInfoTappedEvent event,
    Emitter<EventsDiscoveryState> emit,
  ) async {
    // Handle event info tap
  }

  _onEventPrimaryButtonTapped(
    EventPrimaryButtonTappedEvent event,
    Emitter<EventsDiscoveryState> emit,
  ) async {
    // Handle event primary button tap
  }

  _onEventSecondaryButtonTapped(
    EventSecondaryButtonTappedEvent event,
    Emitter<EventsDiscoveryState> emit,
  ) async {
    // Handle event secondary button tap
  }

  _onBottomNavigationItemTapped(
    BottomNavigationItemTappedEvent event,
    Emitter<EventsDiscoveryState> emit,
  ) async {
    emit(state.copyWith(selectedBottomBarIndex: event.index));
  }

  _onFloatingButtonTapped(
    FloatingButtonTappedEvent event,
    Emitter<EventsDiscoveryState> emit,
  ) async {
    // Handle floating button tap
  }

  _onBottomBarInfoTapped(
    BottomBarInfoTappedEvent event,
    Emitter<EventsDiscoveryState> emit,
  ) async {
    // Handle bottom bar info tap
  }
}
