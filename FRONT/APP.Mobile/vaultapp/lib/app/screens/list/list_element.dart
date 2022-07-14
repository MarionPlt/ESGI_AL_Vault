import 'package:flutter/material.dart';

class ListElement extends StatelessWidget {
  const ListElement({
    Key? key,
    required this.title,
    required this.author,
    required this.aquisitionDate,
    required this.parutionDate,
    required this.state
  }) : super(key: key);

  final String title;
  final String author;
  final String aquisitionDate;
  final String parutionDate;
  final String state;


  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Stack(
        children: [
          Padding(
            padding:
            EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment:
                          MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional
                                    .fromSTEB(10, 10, 10, 10),
                                child: Image.network(
                                  'https://picsum.photos/seed/822/600',
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                  EdgeInsetsDirectional
                                      .fromSTEB(
                                      0, 0, 0, 5),
                                  child: Text(
                                    title,
                                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)
                                  ),
                                ),
                                Text(
                                  author,
                                  style: const TextStyle(
                                    fontSize: 14 ,
                                    fontWeight:
                                    FontWeight.normal,
                                  ),
                                ),
                                Text(
                                  state,
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding:
            EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  'Date d\'aquisition : ',
                  style:
                  TextStyle(fontSize: 14, fontWeight: FontWeight.bold)
                ),
                Text(
                  this.aquisitionDate,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal)
                ),
              ],
            ),
          ),
        ],
      ),
    );

  }
}
