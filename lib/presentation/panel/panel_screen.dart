import 'package:flutter/material.dart';
import 'package:flutter_bloc_state_management/presentation/fetch_data/view/fetch_data_screen.dart';
import 'package:flutter_bloc_state_management/presentation/fetch_list/view/fetch_list_screen.dart';
import 'package:flutter_bloc_state_management/presentation/home/view/home_screen.dart';

class PanelScreen extends StatelessWidget {
  const PanelScreen({super.key});

  final String _panel = 'Panel';
  final String _dummyGetData = 'dummy get data';
  final String _fetchData = 'fetch data';
  final String _fetchList = 'fetch list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_panel)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            _CustomButton(
              onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HomeScreen())),
              text: _dummyGetData,
            ),
            const SizedBox(height: 20),
            _CustomButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const FetchDataScreen())),
              text: _fetchData,
            ),
            const SizedBox(height: 20),
            _CustomButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const FetchListScreen())),
              text: _fetchList,
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomButton extends StatelessWidget {
  const _CustomButton({
    required this.onPressed,
    required this.text,
  });

  final Function onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: () => onPressed(),
        child: Text(text),
      ),
    );
  }
}
