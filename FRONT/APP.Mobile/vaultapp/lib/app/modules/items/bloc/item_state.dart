part of 'item_bloc.dart';

@immutable
abstract class ItemState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ItemInitialState extends ItemState {}

class ItemLoadingState extends ItemState {
}

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
  
  GetUserItemSuccessState(this.userItem);

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

  GetAllUserItemsSuccessState(this.userItems);

  @override
  List<Object?> get props => [userItems];
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