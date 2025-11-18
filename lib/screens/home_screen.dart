import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter + Provider + API"),
      ),

      body: Column(
        children: [
          SizedBox(height: 20),

          Text(
            provider.message,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          SizedBox(height: 20),

          // Load Users Button
          ElevatedButton(
            onPressed: () {
              provider.getUsers();
            },
            child: Text("Fetch Users"),
          ),

          // UI Change Button
          ElevatedButton(
            onPressed: () {
              provider.updateMessage();
            },
            child: Text("Change UI"),
          ),

          SizedBox(height: 20),

          provider.isLoading
              ? CircularProgressIndicator()
              : Expanded(
            child: ListView.builder(
              itemCount: provider.users.length,
              itemBuilder: (context, index) {
                final user = provider.users[index];
                return ListTile(
                  leading: CircleAvatar(child: Text(user.id.toString())),
                  title: Text(user.name),
                  subtitle: Text(user.email),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
