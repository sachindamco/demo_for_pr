part of 'events_discovery_bloc.dart';

class EventsDiscoveryState extends Equatable {
  final EventsDiscoveryModel? eventsDiscoveryModel;
  final int? selectedBottomBarIndex;

  EventsDiscoveryState({
    this.eventsDiscoveryModel,
    this.selectedBottomBarIndex,
  });

  @override
  List<Object?> get props => [
        eventsDiscoveryModel,
        selectedBottomBarIndex,
      ];

  EventsDiscoveryState copyWith({
    EventsDiscoveryModel? eventsDiscoveryModel,
    int? selectedBottomBarIndex,
  }) {
    return EventsDiscoveryState(
      eventsDiscoveryModel: eventsDiscoveryModel ?? this.eventsDiscoveryModel,
      selectedBottomBarIndex:
          selectedBottomBarIndex ?? this.selectedBottomBarIndex,
    );
  }
}
