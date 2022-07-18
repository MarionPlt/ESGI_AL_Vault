import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:vaultapp/app/app_routes.dart';
import 'package:vaultapp/app/modules/items/bloc/item_bloc.dart';
import 'package:vaultapp/app/modules/items/data/interceptors/creation_interceptor.dart';
import 'package:vaultapp/app/modules/items/data/models/item.dart';
import 'package:vaultapp/app/modules/items/data/models/user_item.dart';
import 'package:vaultapp/core/di/locator.dart';

class AddUserItemScreen extends StatefulWidget {
  const AddUserItemScreen({Key? key, required this.item}) : super(key: key);

  final Item item;

  @override
  State<AddUserItemScreen> createState() => _AddUserItemScreenState();
}

class _AddUserItemScreenState extends State<AddUserItemScreen> {
  final interceptor = ItemCreationInterceptor();
  int _currentRequest = 0;

  final ItemBloc itemBloc = locator<ItemBloc>();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _acquisitionDateController = TextEditingController();
  final _stateController = TextEditingController();
  final _collectionController = TextEditingController();

  @override
  void initState() {
    _stateController.text = "FactoryNew";
    _currentRequest = interceptor.get() + 1;
    super.initState();
  }

  _onSubmit(Item item) {
    final DateTime acquisitionDate =
        DateTime.parse(_acquisitionDateController.text);
    final userItem = UserItem(
        acquisitionDate: acquisitionDate,
        state: _stateController.text,
        collection: _collectionController.text,
        item: item);
    itemBloc.add(CreateUserItemEvent(userItem, _currentRequest));
  }

  @override
  Widget build(BuildContext context) {
    final Item item = widget.item;
    return BlocListener<ItemBloc, ItemState>(
      listener: (context, state) {
        if (state is UserItemCreatedState) {
          Navigator.pushReplacementNamed(context, homeScreen);
        } else if (state is UserItemCreationFailedState) {
          _currentRequest = interceptor.get() + 1;
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.message),
            action: SnackBarAction(label: "Fermer", onPressed: () {}),
          ));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Ajouter un objet à votre collection"),
          automaticallyImplyLeading: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Objet à ajouter : ${widget.item.label}",
                    style: const TextStyle(fontSize: 20)),
                SizedBox(
                  height: 3.h,
                ),
                const Text("Informations de possession : ",
                    style: TextStyle(fontSize: 15)),
                SizedBox(
                  height: 2.h,
                ),
                TextField(
                  controller: _acquisitionDateController,
                  decoration:
                      const InputDecoration(labelText: "Date d'acquisition *"),
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
                        _acquisitionDateController.text = formattedDate;
                      });
                    }
                  },
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  children: [
                    const Text("État : "),
                    DropdownButton<String>(
                      style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      value: _stateController.text,
                      onChanged: (String? newValue) {
                        setState(() {
                          _stateController.text = newValue!;
                        });
                      },
                      items: const [
                        DropdownMenuItem(
                          value: "FactoryNew",
                          child: Text("Neuf"),
                        ),
                        DropdownMenuItem(
                          value: "MinimalWear",
                          child: Text("Très légèrement abimé"),
                        ),
                        DropdownMenuItem(
                          value: "FieldTested",
                          child: Text("Peu abimé"),
                        ),
                        DropdownMenuItem(
                          value: "WellWorn",
                          child: Text("Abimé"),
                        ),
                        DropdownMenuItem(
                          value: "BattleScarred",
                          child: Text("Très abimé"),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 3.h),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Collection'),
                  controller: _collectionController,
                ),
                TextButton(
                    onPressed: () {
                      _onSubmit(item);
                    },
                    child: const Text("Ajouter l'objet"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
