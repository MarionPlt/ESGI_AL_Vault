import 'package:flutter/material.dart';
import 'package:vaultapp/app/modules/items/data/models/book.dart';
import 'package:vaultapp/app/modules/items/data/models/user_item.dart';
import 'package:vaultapp/app/screens/list/list_element.dart';

class BooksScreen extends StatefulWidget {

  const BooksScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _bookScreenState();
}

  class _bookScreenState extends State<BooksScreen> {

    List<UserItem> bookModel = [];
  List<Map<String, dynamic>> bookList = [
    {
      "id": '1',
      "acquisitionDate": "1997-10-10",
      "state": "neuf",
      "collection": "Mes livres de Hugo",
      "item": {
        "label": 'Les misérables',
        "type": "roman",
        "releaseDate": "1997-10-10"
      },
    },
    {
      "id": '1',
      "acquisitionDate": "1997-10-10",
      "state": "neuf",
      "collection": "Mes livres de Hugo",
      "item": {
        "label": 'Les misérables',
        "type": "roman",
        "releaseDate": "1997-10-10"
      },
    },
  ];

  @override
  void initState() {
    bookModel = bookList.map((e) => UserItem.fromJson(e)).toList();
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        child: Center(
          child: ListView(
            children: [
          
            ],
          ),
        ),
      ),
    );
  }

  }
  
  

  
