import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_category_item.dart';
import './bloc/genre_selection_bloc.dart';
import './models/genre_selection_model.dart';

class GenreSelectionScreen extends StatelessWidget {
  const GenreSelectionScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<GenreSelectionBloc>(
      create: (context) => GenreSelectionBloc(GenreSelectionState(
        genreSelectionModel: GenreSelectionModel(),
      ))
        ..add(GenreSelectionInitialEvent()),
      child: const GenreSelectionScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.red_100,
      body: BlocConsumer<GenreSelectionBloc, GenreSelectionState>(
        listener: (context, state) {
          if (state.isSubmitted ?? false) {
            NavigatorService.pushNamed(AppRoutes.eventsDiscoveryScreen);
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.h),
              child: Column(
                spacing: 36.h,
                children: [
                  SizedBox(height: 48.h),
                  Text(
                    'Choose 3 or more genres that best describe you',
                    textAlign: TextAlign.center,
                    style: TextStyleHelper.instance.headline24BoldPhilosopher
                        .copyWith(height: 1.25),
                  ),
                  _buildGenresGrid(context, state),
                  SizedBox(height: 40.h),
                  CustomButton(
                    text: 'Submit',
                    buttonStyle: CustomButtonStyle.primary,
                    width: double.infinity,
                    isEnabled: (state.selectedGenres?.length ?? 0) >= 3,
                    onPressed: (state.selectedGenres?.length ?? 0) >= 3
                        ? () {
                            context.read<GenreSelectionBloc>().add(
                                  SubmitGenresEvent(),
                                );
                          }
                        : null,
                  ),
                  SizedBox(height: 32.h),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildGenresGrid(BuildContext context, GenreSelectionState state) {
    return Column(
      spacing: 16.h,
      children: [
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 16.h,
            crossAxisSpacing: 16.h,
            childAspectRatio: 0.8,
          ),
          itemCount: state.genreSelectionModel?.genres?.length ?? 0,
          itemBuilder: (context, index) {
            final genre = state.genreSelectionModel!.genres![index];
            final isSelected =
                state.selectedGenres?.contains(genre.id) ?? false;

            return CustomCategoryItem(
              imagePath: genre.imagePath ?? '',
              title: genre.title ?? '',
              textColor: genre.isActive ?? true
                  ? (isSelected ? Color(0xFF262626) : appTheme.gray_900)
                  : appTheme.colorBF2626,
              onTap: (genre.isActive ?? true)
                  ? () {
                      context.read<GenreSelectionBloc>().add(
                            ToggleGenreSelectionEvent(genre.id ?? ''),
                          );
                    }
                  : null,
            );
          },
        ),
      ],
    );
  }
}
