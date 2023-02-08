import 'package:flutter/material.dart';
import 'package:flutter_lifecycle/screen/home_screen.dart';

void main() {
  runApp(MaterialApp(
    home: Root(),
  ));
}

class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);

  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  Color color = Colors.purple;
  bool show = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100.0),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: show
                      ? HomeScreen(
                          color: color,
                        )
                      : Container(),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        color = color == Colors.orange
                            ? Colors.purple
                            : Colors.orange;
                      });
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.amber[600]),
                    child: Text(
                      '색 바꾸기',
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        show = !show;
                      });
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.amber[700]),
                    child: Text(
                      !show ? '위젯 생성' : '위젯 삭제',
                    ),
                  ),
                  const SizedBox(height: 100.0),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
