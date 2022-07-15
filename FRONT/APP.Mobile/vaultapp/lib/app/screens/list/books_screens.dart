import 'package:flutter/material.dart';
import 'package:vaultapp/app/modules/items/data/models/book.dart';
import 'package:vaultapp/app/screens/list/list_element.dart';

class BooksScreen extends StatelessWidget {
  BooksScreen({Key? key}) : super(key: key);

  List<Book> bookModel = [];
  List<Map<String, dynamic>> bookList = [
    {
      "id": 1,
      "title,": 'Les misérables',
      "author": 'Victor Hugo',
      "aquisitionDate,": '13-07-2020',
      "parutionDate": '13/09-1862',
      "imagePath,": '',
      "state": 'Neuf'
    },
    {
      "id": 2,
      "title,": 'Les travailleur de la mer',
      "author": 'Victor Hugo',
      "aquisitionDate,": '13-07-2020',
      "parutionDate": '13/09-1862',
      "imagePath,": '',
      "state": 'Abimé'
    },

  ];

  @override
  void initState() {
    bookModel = bookList.map((e) => Book.fromJson(e)).toList();
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        child: Center(
          child: ListView(
            children: [
              Column(
                children: bookModel.map((e) =>
                    ListElement(title: e.label, author: e.authors, aquisitionDate: e.releaseDate.toIso8601String(), parutionDate: e.releaseDate.toIso8601String(), state: e.type)).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
