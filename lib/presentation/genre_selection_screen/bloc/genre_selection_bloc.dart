import '../../../core/app_export.dart';
import '../models/genre_selection_model.dart';

part 'genre_selection_event.dart';
part 'genre_selection_state.dart';

class GenreSelectionBloc
    extends Bloc<GenreSelectionEvent, GenreSelectionState> {
  GenreSelectionBloc(GenreSelectionState initialState) : super(initialState) {
    on<GenreSelectionInitialEvent>(_onInitialize);
    on<ToggleGenreSelectionEvent>(_onToggleGenreSelection);
    on<SubmitGenresEvent>(_onSubmitGenres);
  }

  _onInitialize(
    GenreSelectionInitialEvent event,
    Emitter<GenreSelectionState> emit,
  ) async {
    final genres = [
      GenreModel(
        id: 'art_craft',
        imagePath: ImageConstant.imgEllipse1618,
        title: 'Art & Craft',
        isActive: true,
      ),
      GenreModel(
        id: 'rock',
        imagePath: ImageConstant.imgEllipse1618114x114,
        title: 'Rock',
        isActive: true,
      ),
      GenreModel(
        id: 'ghazal_1',
        imagePath: ImageConstant.imgEllipse16181,
        title: 'Ghazal',
        isActive: false,
      ),
      GenreModel(
        id: 'bollywood',
        imagePath: ImageConstant.imgEllipse16181,
        title: 'Bollywood',
        isActive: false,
      ),
      GenreModel(
        id: 'indian_classical',
        imagePath: ImageConstant.imgEllipse16181,
        title: 'Indian Classical',
        isActive: true,
      ),
      GenreModel(
        id: 'ghazal_2',
        imagePath: ImageConstant.imgEllipse16182,
        title: 'Ghazal',
        isActive: true,
      ),
      GenreModel(
        id: 'hollywood',
        imagePath: ImageConstant.imgEllipse16183,
        title: 'Hollywood',
        isActive: true,
      ),
      GenreModel(
        id: 'music',
        imagePath: ImageConstant.imgEllipse16184,
        title: 'Music',
        isActive: true,
      ),
      GenreModel(
        id: 'poetry',
        imagePath: ImageConstant.imgEllipse16181,
        title: 'Poetry',
        isActive: false,
      ),
      GenreModel(
        id: 'painting',
        imagePath: ImageConstant.imgEllipse16185,
        title: 'Painting',
        isActive: true,
      ),
      GenreModel(
        id: 'swimming',
        imagePath: ImageConstant.imgEllipse16186,
        title: 'Swimming',
        isActive: true,
      ),
      GenreModel(
        id: 'sports',
        imagePath: ImageConstant.imgEllipse16187,
        title: 'Sports',
        isActive: true,
      ),
    ];

    emit(state.copyWith(
      genreSelectionModel: GenreSelectionModel(genres: genres),
      selectedGenres: [],
    ));
  }

  _onToggleGenreSelection(
    ToggleGenreSelectionEvent event,
    Emitter<GenreSelectionState> emit,
  ) async {
    final currentSelected = List<String>.from(state.selectedGenres ?? []);

    if (currentSelected.contains(event.genreId)) {
      currentSelected.remove(event.genreId);
    } else {
      currentSelected.add(event.genreId);
    }

    emit(state.copyWith(selectedGenres: currentSelected));
  }

  _onSubmitGenres(
    SubmitGenresEvent event,
    Emitter<GenreSelectionState> emit,
  ) async {
    if ((state.selectedGenres?.length ?? 0) >= 3) {
      emit(state.copyWith(isSubmitted: true));
    }
  }
}
