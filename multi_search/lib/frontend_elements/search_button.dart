import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ElevatedButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
            elevation: MaterialStateProperty.all(8),
            backgroundColor: MaterialStateProperty.all(Colors.blue[700]),
            shadowColor: MaterialStateProperty.all(Colors.amber),
          ),
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
                    Text("Start Search",
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
