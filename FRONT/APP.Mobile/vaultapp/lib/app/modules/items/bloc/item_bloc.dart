import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  ItemBloc() : super(ItemInitialState()) {
    on<GetItemEvent>((event, emit) {
      emit(ItemLoadingState());
    });
  }
}