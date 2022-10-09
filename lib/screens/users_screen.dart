import 'package:flutter/material.dart';
import 'package:grocery_app/models/users_model.dart';
import 'package:grocery_app/services/api_handler.dart';
import 'package:grocery_app/widgets/user_widget.dart';
import 'package:provider/provider.dart';

class UsersWidget extends StatelessWidget {
  const UsersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Users'),
      ),
      body: FutureBuilder<List<UsersModel>>(
        future: APIHandler.getUsers(),
        builder:
            (BuildContext context, AsyncSnapshot<List<UsersModel>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('An error occured ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: snapshot.data!.length,
              //   itemExtent: ,
              itemBuilder: (BuildContext context, int index) {
                return ChangeNotifierProvider.value(
                  value: snapshot.data![index],
                  child: const CustomContainer());
              },
            );
          } else {
            return const Center(
              child: Text('No products has been added yet'),
            );
          }
        },
      ),
    );
  }
}
