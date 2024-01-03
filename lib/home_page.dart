import 'package:finstagram/second_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                child: Text("Go to next page"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Secondpage(),
                    ),
                  );
                },
              ),
              Positioned(
                height: MediaQuery.of(context).size.height /12,
                child: FloatingActionButton(
                  onPressed: () {},
                  child: Text("Add Image"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
