import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_bottom_navigation_bar.dart';
import '../../widgets/custom_event_bottom_bar.dart';
import '../../widgets/custom_header_app_bar.dart';
import '../../widgets/custom_image_view.dart';
import './bloc/events_discovery_bloc.dart';
import './models/events_discovery_model.dart';
import './widgets/category_chip_item.dart';
import './widgets/event_card_item.dart';

class EventsDiscoveryScreen extends StatelessWidget {
  const EventsDiscoveryScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<EventsDiscoveryBloc>(
      create: (context) => EventsDiscoveryBloc(EventsDiscoveryState(
        eventsDiscoveryModel: EventsDiscoveryModel(),
      ))
        ..add(EventsDiscoveryInitialEvent()),
      child: EventsDiscoveryScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventsDiscoveryBloc, EventsDiscoveryState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: appTheme.red_100,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(80.h),
            child: CustomHeaderAppBar(
              logoPath: ImageConstant.imgUnion,
              onMenuTap: () {
                context.read<EventsDiscoveryBloc>().add(MenuTappedEvent());
              },
              onSearchTap: () {
                context.read<EventsDiscoveryBloc>().add(SearchTappedEvent());
              },
              onNotificationTap: () {
                context
                    .read<EventsDiscoveryBloc>()
                    .add(NotificationTappedEvent());
              },
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              spacing: 36.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildCategorySection(context, state),
                _buildEventsSection(context, state),
              ],
            ),
          ),
          bottomNavigationBar: CustomBottomNavigationBar(
            bottomBarItems:
                _getBottomNavigationItems(), // Modified: Removed explicit type parameter to resolve type mismatch
            selectedIndex: state.selectedBottomBarIndex ?? 3,
            onItemTap: (index) {
              context.read<EventsDiscoveryBloc>().add(
                    BottomNavigationItemTappedEvent(index: index),
                  );
            },
            onFloatingButtonTap: () {
              context
                  .read<EventsDiscoveryBloc>()
                  .add(FloatingButtonTappedEvent());
            },
          ),
        );
      },
    );
  }

  Widget _buildCategorySection(
      BuildContext context, EventsDiscoveryState state) {
    return Container(
      margin: EdgeInsets.only(top: 16.h, left: 24.h),
      decoration: BoxDecoration(
        color: appTheme.red_100,
        border: Border(
          bottom: BorderSide(
            color: appTheme.red_200,
            width: 1.h,
          ),
        ),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          spacing: 16.h,
          children: List.generate(
            state.eventsDiscoveryModel?.categories?.length ?? 0,
            (index) {
              final category = state.eventsDiscoveryModel?.categories?[index];
              return CategoryChipItem(
                categoryChipItemModel: category!,
                onTap: () {
                  context.read<EventsDiscoveryBloc>().add(
                        CategorySelectedEvent(index: index),
                      );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildEventsSection(BuildContext context, EventsDiscoveryState state) {
    return Container(
      width: double.infinity,
      height: 952.h,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Container(
            margin: EdgeInsets.only(left: 24.h, right: 24.h),
            child: Column(
              spacing: 20.h,
              children: [
                Column(
                  spacing: 20.h,
                  children: List.generate(
                    state.eventsDiscoveryModel?.eventCards?.length ?? 0,
                    (index) {
                      final eventCard =
                          state.eventsDiscoveryModel?.eventCards?[index];
                      return EventCardItem(
                        eventCardItemModel: eventCard!,
                        onInfoTap: () {
                          context.read<EventsDiscoveryBloc>().add(
                                EventInfoTappedEvent(index: index),
                              );
                        },
                        onPrimaryButtonTap: () {
                          context.read<EventsDiscoveryBloc>().add(
                                EventPrimaryButtonTappedEvent(index: index),
                              );
                        },
                        onSecondaryButtonTap: () {
                          context.read<EventsDiscoveryBloc>().add(
                                EventSecondaryButtonTappedEvent(index: index),
                              );
                        },
                      );
                    },
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: appTheme.deep_orange_100,
                    border: Border.all(
                      color: appTheme.red_200,
                      width: 1.h,
                    ),
                    borderRadius: BorderRadius.circular(16.h),
                  ),
                  child: Stack(
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgImage,
                        height: 184.h,
                        width: 380.h,
                        fit: BoxFit.cover,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          margin: EdgeInsets.only(top: 16.h, right: 16.h),
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.h,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: appTheme.deep_orange_100,
                            border: Border.all(
                              color: appTheme.red_200,
                              width: 1.h,
                            ),
                            borderRadius: BorderRadius.circular(8.h),
                          ),
                          child: Text(
                            'FILLING FAST',
                            style: TextStyleHelper
                                .instance.body12MediumMontserrat
                                .copyWith(color: appTheme.gray_800),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 268.h),
              child: CustomEventBottomBar(
                title: 'Rhythm with Karan',
                location: 'Auditorium',
                dateTime: 'Mon 08 Sep, 08:30PM',
                onInfoTap: () {
                  context.read<EventsDiscoveryBloc>().add(
                        BottomBarInfoTappedEvent(),
                      );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<CustomBottomNavigationBarItem> _getBottomNavigationItems() {
    return [
      CustomBottomNavigationBarItem(
        title: 'HOME',
        iconPath: ImageConstant.imgHome,
      ),
      CustomBottomNavigationBarItem(
        title: 'BOOK',
        iconPath: ImageConstant.imgBook,
      ),
      CustomBottomNavigationBarItem(
        title: 'My E-card',
      ),
      CustomBottomNavigationBarItem(
        title: 'EVENTS',
        iconPath: ImageConstant.imgEventsFilledIcon,
      ),
      CustomBottomNavigationBarItem(
        title: 'TREVI',
        iconPath: ImageConstant.imgTreviOutline,
      ),
    ];
  }
}

// Modified: Removed local CustomBottomNavigationBarItem class to avoid type conflict
