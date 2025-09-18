part of 'genre_selection_bloc.dart';

abstract class GenreSelectionEvent extends Equatable {
  const GenreSelectionEvent();

  @override
  List<Object?> get props => [];
}

class GenreSelectionInitialEvent extends GenreSelectionEvent {}

class ToggleGenreSelectionEvent extends GenreSelectionEvent {
  final String genreId;

  const ToggleGenreSelectionEvent(this.genreId);

  @override
  List<Object?> get props => [genreId];
}

class SubmitGenresEvent extends GenreSelectionEvent {}
