import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vaultapp/app/modules/auth/data/repositories/secure_storage_repository.dart';
import 'package:vaultapp/app/modules/items/data/interceptors/creation_interceptor.dart';
import 'package:vaultapp/app/modules/items/data/models/book.dart';
import 'package:vaultapp/app/modules/items/data/models/item.dart';
import 'package:vaultapp/app/modules/items/data/models/movie.dart';
import 'package:vaultapp/app/modules/items/data/models/user_item.dart';
import 'package:vaultapp/app/modules/items/data/models/video_game.dart';
import 'package:vaultapp/app/modules/items/data/repositories/item_library_repository.dart';
import 'package:vaultapp/app/modules/items/data/repositories/local_item_livrary_repository.dart';

part 'item_event.dart';
part 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  final interceptor = ItemCreationInterceptor();
  final ItemLibraryRepository _itemLibraryRepository = ItemLibraryRepository();
  final SecureStorageRepository _storageRepository = SecureStorageRepository();
  final LocalItemLibraryRepository _localItemLibraryRepository =
      LocalItemLibraryRepository();

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
        if (event.currentRequestNumber != interceptor.get()) {
          interceptor.increment();
        } else {
          throw Exception(
              "Veuillez patienter avant de soumettre à nouveau ce formulaire");
        }
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
      } on SocketException catch (_) {
        final result =
            await _localItemLibraryRepository.getUserItem(event.userItemId);
        emit(GetUserItemSuccessState(result, isOffline: true));
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
      } on SocketException catch (_) {
        final result = await _localItemLibraryRepository.getAllUserItems();
        emit(GetAllUserItemsSuccessState(result, isOffline: true));
      } catch (e) {
        emit(GetAllUserItemsFailedState(e.toString()));
      }
    });

    on<CreateUserItemEvent>((event, emit) async {
      emit(ItemLoadingState());
      try {
        if (event.currentRequestNumber != interceptor.get()) {
          interceptor.increment();
        } else {
          throw Exception(
              "Veuillez patienter avant de soumettre à nouveau ce formulaire");
        }
        final userId = await _storageRepository.getUserId();
        if (userId == null) {
          throw Exception("Not connected");
        }
        final result = await _itemLibraryRepository.createUserItem(
            event.userItem, event.userItem.item.id!, userId);
        await _localItemLibraryRepository.addUserItem(result);
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
        await _localItemLibraryRepository.updateUserItem(event.userItem);
        emit(UserItemUpdatedState(result));
      } catch (e) {
        emit(UserItemUpdateFailedState(e.toString()));
      }
    });
  }
}
