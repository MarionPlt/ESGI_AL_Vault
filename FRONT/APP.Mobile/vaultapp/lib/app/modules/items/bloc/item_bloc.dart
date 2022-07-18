import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vaultapp/app/modules/auth/data/repositories/secure_storage_repository.dart';
import 'package:vaultapp/app/modules/items/data/models/book.dart';
import 'package:vaultapp/app/modules/items/data/models/item.dart';
import 'package:vaultapp/app/modules/items/data/models/movie.dart';
import 'package:vaultapp/app/modules/items/data/models/user_item.dart';
import 'package:vaultapp/app/modules/items/data/models/video_game.dart';
import 'package:vaultapp/app/modules/items/data/repositories/item_library_repository.dart';

part 'item_event.dart';
part 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  final ItemLibraryRepository _itemLibraryRepository = ItemLibraryRepository();
  final SecureStorageRepository _storageRepository = SecureStorageRepository();

  ItemBloc() : super(ItemInitialState()) {
    on<GetItemEvent>((event, emit) async {
      emit(ItemLoadingState());
      try {
        final result = await _itemLibraryRepository.getItemById(event.itemId);
        emit(GetItemSuccessState(result));
      } catch (e) {
        emit(GetItemFailedState(e.toString()));
      }
    });

    on<GetAllItemsEvent>((event, emit) async {
      emit(ItemLoadingState());
      try {
        final result = await _itemLibraryRepository.getAllItems(
            event.typeFilter, event.labelFilter);
        emit(GetAllItemsSuccessState(result));
      } catch (e) {
        emit(GetAllItemsFailedState(e.toString()));
      }
    });

    on<CreateBookEvent>((event, emit) async {
      emit(ItemLoadingState());
      try {
        final result = await _itemLibraryRepository.createBook(event.book);
        emit(ItemCreatedState(result));
      } catch (e) {
        emit(ItemCreationFailedState(e.toString()));
      }
    });
    on<CreateMovieEvent>((event, emit) async {
      emit(ItemLoadingState());
      try {
        final result = await _itemLibraryRepository.createMovie(event.movie);
        emit(ItemCreatedState(result));
      } catch (e) {
        emit(ItemCreationFailedState(e.toString()));
      }
    });
    on<CreateVideoGameEvent>((event, emit) async {
      emit(ItemLoadingState());
      try {
        final result =
            await _itemLibraryRepository.createVideoGame(event.videoGame);
        emit(ItemCreatedState(result));
      } catch (e) {
        emit(ItemCreationFailedState(e.toString()));
      }
    });

    on<GetUserItemEvent>((event, emit) async {
      emit(ItemLoadingState());
      try {
        final result =
            await _itemLibraryRepository.getUserItemById(event.userItemId);
        emit(GetUserItemSuccessState(result));
      } catch (e) {
        emit(GetUserItemFailedState(e.toString()));
      }
    });

    on<GetAllUserItemsEvent>((event, emit) async {
      emit(ItemLoadingState());
      try {
        final userId = await _storageRepository.getUserId();
        if (userId == null) {
          throw Exception("Not connected");
        }
        final result = await _itemLibraryRepository.getAllUserItems(userId);
        emit(GetAllUserItemsSuccessState(result));
      } catch (e) {
        emit(GetAllUserItemsFailedState(e.toString()));
      }
    });

    on<CreateUserItemEvent>((event, emit) async {
      emit(ItemLoadingState());
      try {
        final userId = await _storageRepository.getUserId();
        if (userId == null) {
          throw Exception("Not connected");
        }
        final result = await _itemLibraryRepository.createUserItem(
            event.userItem, event.userItem.item.id!, userId);
        emit(UserItemCreatedState(result));
      } catch (e) {
        emit(UserItemCreationFailedState(e.toString()));
      }
    });

    on<UpdateUserItemEvent>((event, emit) async {
      emit(ItemLoadingState());
      try {
        final result =
            await _itemLibraryRepository.updateUserItem(event.userItem);
        emit(UserItemUpdatedState(result));
      } catch (e) {
        emit(UserItemUpdateFailedState(e.toString()));
      }
    });
  }
}
