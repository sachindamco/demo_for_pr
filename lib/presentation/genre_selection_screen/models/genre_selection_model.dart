import '../../../core/app_export.dart';

class GenreSelectionModel extends Equatable {
  GenreSelectionModel({this.genres}) {
    genres = genres ?? [];
  }

  List<GenreModel>? genres;

  GenreSelectionModel copyWith({
    List<GenreModel>? genres,
  }) {
    return GenreSelectionModel(
      genres: genres ?? this.genres,
    );
  }

  @override
  List<Object?> get props => [genres];
}

class GenreModel extends Equatable {
  GenreModel({
    this.id,
    this.imagePath,
    this.title,
    this.isActive,
  }) {
    id = id ?? '';
    imagePath = imagePath ?? '';
    title = title ?? '';
    isActive = isActive ?? true;
  }

  String? id;
  String? imagePath;
  String? title;
  bool? isActive;

  GenreModel copyWith({
    String? id,
    String? imagePath,
    String? title,
    bool? isActive,
  }) {
    return GenreModel(
      id: id ?? this.id,
      imagePath: imagePath ?? this.imagePath,
      title: title ?? this.title,
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  List<Object?> get props => [id, imagePath, title, isActive];
}
