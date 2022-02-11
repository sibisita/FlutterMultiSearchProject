import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          onPressed: () {},
          child: Column(
            children: [
              SizedBox(
                height: 100,
                child: Row(
                  children: [
                    Spacer(
                      flex: 2,
                    ),
                    Icon(Icons.search),
                    Spacer(),
                    Text("Search",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold)),
                    Spacer(flex: 2),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
