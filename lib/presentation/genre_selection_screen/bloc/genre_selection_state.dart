part of 'genre_selection_bloc.dart';

class GenreSelectionState extends Equatable {
  final GenreSelectionModel? genreSelectionModel;
  final List<String>? selectedGenres;
  final bool? isSubmitted;

  const GenreSelectionState({
    this.genreSelectionModel,
    this.selectedGenres,
    this.isSubmitted,
  });

  @override
  List<Object?> get props => [
        genreSelectionModel,
        selectedGenres,
        isSubmitted,
      ];

  GenreSelectionState copyWith({
    GenreSelectionModel? genreSelectionModel,
    List<String>? selectedGenres,
    bool? isSubmitted,
  }) {
    return GenreSelectionState(
      genreSelectionModel: genreSelectionModel ?? this.genreSelectionModel,
      selectedGenres: selectedGenres ?? this.selectedGenres,
      isSubmitted: isSubmitted ?? this.isSubmitted,
    );
  }
}
