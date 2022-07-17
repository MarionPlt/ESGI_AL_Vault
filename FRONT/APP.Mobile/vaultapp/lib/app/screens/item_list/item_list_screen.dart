import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:vaultapp/app/app_routes.dart';
import 'package:vaultapp/app/modules/items/bloc/item_bloc.dart';
import 'package:vaultapp/app/screens/item_list/widgets/item_tile_widget.dart';
import 'package:vaultapp/core/di/locator.dart';

class ItemListScreen extends StatefulWidget {
  const ItemListScreen({Key? key}) : super(key: key);

  @override
  State<ItemListScreen> createState() => _ItemListScreenState();
}

class _ItemListScreenState extends State<ItemListScreen> {
  final ItemBloc itemBloc = locator<ItemBloc>();
  final _typeController = TextEditingController();
  final _releaseDateController = TextEditingController();
  final _labelController = TextEditingController();

  bool isExpanded = false;

  @override
  void initState() {
    itemBloc.add(GetAllItemsEvent(null, null));
    super.initState();
  }

  _search() {
    String? typeFilter = null;
    if (_typeController.text != "") {
      typeFilter = _typeController.text;
    }
    DateTime? releaseDateFilter;
    String? labelFilter = null;
    if (_labelController.text.trim() != "") {
      labelFilter = _labelController.text;
    }

    itemBloc.add(GetAllItemsEvent(typeFilter, labelFilter));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              child: const Icon(Icons.close),
              onTap: () {
                Navigator.pushReplacementNamed(context, homeScreen);
              },
            ),
          )
        ],
        title: const Text("Liste d'objets"),
      ),
      body: BlocBuilder<ItemBloc, ItemState>(
        builder: (context, state) {
          if (state is GetAllItemsSuccessState) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  ExpansionPanelList(
                    children: [
                      ExpansionPanel(
                          isExpanded: isExpanded,
                          canTapOnHeader: true,
                          headerBuilder: (context, isExpanded) {
                            return Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Row(children: const [
                                Icon(Icons.search),
                                Text("Recherche")
                              ]),
                            );
                          },
                          body: Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, bottom: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Text("Type d'objet : "),
                                    DropdownButton<String>(
                                      style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                      value: _typeController.text,
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          _typeController.text = newValue ?? "";
                                        });
                                      },
                                      items: const [
                                        DropdownMenuItem(
                                          value: "",
                                          child: Text(""),
                                        ),
                                        DropdownMenuItem(
                                          value: "Movie",
                                          child: Text("Film"),
                                        ),
                                        DropdownMenuItem(
                                          value: "VideoGame",
                                          child: Text("Jeu-vidéo"),
                                        ),
                                        DropdownMenuItem(
                                          value: "Book",
                                          child: Text("Livre"),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: 70.w,
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                        labelText: 'Libellé'),
                                    controller: _labelController,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Center(
                                  child: TextButton(
                                      onPressed: () {
                                        _search();
                                      },
                                      child: const Text("Valider")),
                                )
                              ],
                            ),
                          ))
                    ],
                    expansionCallback: (int item, bool status) {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                  ),
                  ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: state.items.length,
                      itemBuilder: (context, index) {
                        return ItemTile(item: state.items[index]);
                      }),
                  SizedBox(height: 5.h)
                ],
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, createItemScreen);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
