part of 'item_bloc.dart';

abstract class ItemEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetItemEvent extends ItemEvent {
  final String itemId;

  GetItemEvent(this.itemId);

  @override
  List<Object> get props => [itemId];
}

class GetAllItemsEvent extends ItemEvent {
  final String? labelFilter;
  final String? typeFilter;

  GetAllItemsEvent(this.typeFilter, this.labelFilter);
}

class CreateBookEvent extends ItemEvent {
  final Book book;
  final int currentRequestNumber;

  CreateBookEvent(this.book, this.currentRequestNumber);

  @override
  List<Object> get props => [book];
}

class CreateMovieEvent extends ItemEvent {
  final Movie movie;

  CreateMovieEvent(this.movie);

  @override
  List<Object> get props => [movie];
}

class CreateVideoGameEvent extends ItemEvent {
  final VideoGame videoGame;

  CreateVideoGameEvent(this.videoGame);

  @override
  List<Object> get props => [videoGame];
}

class GetUserItemEvent extends ItemEvent {
  final String userItemId;

  GetUserItemEvent(this.userItemId);
}

class GetAllUserItemsEvent extends ItemEvent {}

class CreateUserItemEvent extends ItemEvent {
  final UserItem userItem;
  final int currentRequestNumber;

  CreateUserItemEvent(this.userItem, this.currentRequestNumber);
}

class UpdateUserItemEvent extends ItemEvent {
  final UserItem userItem;

  UpdateUserItemEvent(this.userItem);
}

class RemoveUserItemEvent extends ItemEvent {
  final String userItemId;

  RemoveUserItemEvent(this.userItemId);
}
