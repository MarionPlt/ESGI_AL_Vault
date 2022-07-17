import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:vaultapp/app/modules/items/data/models/book.dart';

class BookDetails extends StatelessWidget {
  const BookDetails({Key? key, required this.book}) : super(key: key);

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 7.h,
        ),
        Text(book.authors),
        SizedBox(
          height: 7.h,
        ),
        Text(book.editor),
        SizedBox(
          height: 3.h,
        ),
        const Icon(Icons.book)
      ],
    );
  }
}
