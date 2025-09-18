part of 'events_discovery_bloc.dart';

abstract class EventsDiscoveryEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class EventsDiscoveryInitialEvent extends EventsDiscoveryEvent {}

class MenuTappedEvent extends EventsDiscoveryEvent {}

class SearchTappedEvent extends EventsDiscoveryEvent {}

class NotificationTappedEvent extends EventsDiscoveryEvent {}

class CategorySelectedEvent extends EventsDiscoveryEvent {
  final int index;

  CategorySelectedEvent({required this.index});

  @override
  List<Object?> get props => [index];
}

class EventInfoTappedEvent extends EventsDiscoveryEvent {
  final int index;

  EventInfoTappedEvent({required this.index});

  @override
  List<Object?> get props => [index];
}

class EventPrimaryButtonTappedEvent extends EventsDiscoveryEvent {
  final int index;

  EventPrimaryButtonTappedEvent({required this.index});

  @override
  List<Object?> get props => [index];
}

class EventSecondaryButtonTappedEvent extends EventsDiscoveryEvent {
  final int index;

  EventSecondaryButtonTappedEvent({required this.index});

  @override
  List<Object?> get props => [index];
}

class BottomNavigationItemTappedEvent extends EventsDiscoveryEvent {
  final int index;

  BottomNavigationItemTappedEvent({required this.index});

  @override
  List<Object?> get props => [index];
}

class FloatingButtonTappedEvent extends EventsDiscoveryEvent {}

class BottomBarInfoTappedEvent extends EventsDiscoveryEvent {}
