import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:vaultapp/app/modules/items/bloc/item_bloc.dart';
import 'package:vaultapp/app/modules/items/data/models/book.dart';
import 'package:vaultapp/app/screens/item_details/item_details_screen.dart';
import 'package:vaultapp/core/di/locator.dart';

class CreateBookScreen extends StatefulWidget {
  const CreateBookScreen({Key? key}) : super(key: key);

  @override
  State<CreateBookScreen> createState() => _CreateBookScreenState();
}

class _CreateBookScreenState extends State<CreateBookScreen> {
  final ItemBloc itemBloc = locator<ItemBloc>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _labelController = TextEditingController();
  final _releaseDateController = TextEditingController();
  final _supportController = TextEditingController();
  final _imageUrlController = TextEditingController();
  final _editorController = TextEditingController();
  final _authorsController = TextEditingController();
  final _volumeController = TextEditingController();

  _onSubmit() {
    if (_formKey.currentState!.validate()) {
      final DateTime releaseDate = DateTime.parse(_releaseDateController.text);
      int? volume;
      if (_volumeController.text.isNotEmpty) {
        volume = int.parse(_volumeController.text);
      }

      final book = Book(
          label: _labelController.text,
          releaseDate: releaseDate,
          authors: _authorsController.text,
          editor: _editorController.text,
          type: "Book",
          imageURL: _imageUrlController.text,
          support: _supportController.text,
          volume: volume);

      itemBloc.add(CreateBookEvent(book));
    }
  }

  @override
  void initState() {
    _releaseDateController.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ItemBloc, ItemState>(
      listener: (context, state) {
        if (state is ItemCreatedState) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ItemDetailsScreen(itemId: state.item.id!)));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Création d'un livre"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Libellé *'),
                  controller: _labelController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Veuillez indiquer un libellé";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 3.h),
                TextField(
                  controller: _releaseDateController,
                  decoration:
                      const InputDecoration(labelText: "Date de sortie *"),
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1950),
                        lastDate: DateTime(2100));

                    if (pickedDate != null) {
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                      setState(() {
                        _releaseDateController.text = formattedDate;
                      });
                    }
                  },
                ),
                SizedBox(height: 3.h),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Support'),
                  controller: _supportController,
                ),
                SizedBox(height: 3.h),
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'Lien vers une image'),
                  controller: _imageUrlController,
                ),
                SizedBox(height: 3.h),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Auteur(s) *'),
                  controller: _authorsController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Veuillez indiquer un ou plusieurs auteurs.";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 3.h),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Editeur *'),
                  controller: _editorController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Veuillez indiquer l'éditeur.";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 3.h),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Volume'),
                  controller: _volumeController,
                ),
                SizedBox(height: 3.h),
                TextButton(
                    onPressed: () {
                      _onSubmit();
                    },
                    child: const Text(
                      "Valider",
                      style: TextStyle(fontSize: 20),
                    )),
                SizedBox(height: 3.h),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
