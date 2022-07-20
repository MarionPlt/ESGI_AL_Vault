part of 'item_bloc.dart';

@immutable
abstract class ItemState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ItemInitialState extends ItemState {
  @override
  List<Object?> get props => [];
}

class ItemLoadingState extends ItemState {}

class GetItemSuccessState extends ItemState {
  final Item item;

  GetItemSuccessState(this.item);

  @override
  List<Object?> get props => [item];
}

class GetItemFailedState extends ItemState {
  final String message;

  GetItemFailedState(this.message);

  @override
  List<Object?> get props => [message];
}

class GetAllItemsSuccessState extends ItemState {
  final List<Item> items;

  GetAllItemsSuccessState(this.items);

  @override
  List<Object?> get props => [items];
}

class GetAllItemsFailedState extends ItemState {
  final String message;

  GetAllItemsFailedState(this.message);

  @override
  List<Object?> get props => [message];
}

class ItemCreatedState extends ItemState {
  final Item item;

  ItemCreatedState(this.item);

  @override
  List<Object?> get props => [item];
}

class ItemCreationFailedState extends ItemState {
  final String message;

  ItemCreationFailedState(this.message);

  @override
  List<Object?> get props => [message];
}

class GetUserItemSuccessState extends ItemState {
  final UserItem userItem;
  final bool isOffline;

  GetUserItemSuccessState(this.userItem, {this.isOffline = false});

  @override
  List<Object?> get props => [userItem];
}

class GetUserItemFailedState extends ItemState {
  final String message;

  GetUserItemFailedState(this.message);

  @override
  List<Object?> get props => [message];
}

class GetAllUserItemsSuccessState extends ItemState {
  final List<UserItem> userItems;
  final bool isOffline;

  GetAllUserItemsSuccessState(this.userItems, {this.isOffline = false});

  @override
  List<Object?> get props => [userItems];
}

class GetAllUserItemsFailedState extends ItemState {
  final String message;

  GetAllUserItemsFailedState(this.message);

  @override
  List<Object?> get props => [message];
}

class UserItemCreatedState extends ItemState {
  final UserItem userItem;

  UserItemCreatedState(this.userItem);

  @override
  List<Object?> get props => [userItem];
}

class UserItemCreationFailedState extends ItemState {
  final String message;

  UserItemCreationFailedState(this.message);

  @override
  List<Object?> get props => [message];
}

class UserItemUpdatedState extends ItemState {
  final UserItem userItem;

  UserItemUpdatedState(this.userItem);

  @override
  List<Object?> get props => [userItem];
}

class UserItemUpdateFailedState extends ItemState {
  final String message;

  UserItemUpdateFailedState(this.message);

  @override
  List<Object?> get props => [message];
}

class UserItemDeletedState extends ItemState {}

class UserItemDeletionFailedState extends ItemState {
  final String message;

  UserItemDeletionFailedState(this.message);

  @override
  List<Object?> get props => [message];
}
