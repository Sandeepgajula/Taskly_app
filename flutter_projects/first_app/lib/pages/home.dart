import 'package:first_app/widgets/customdropdown.dart';
import 'package:flutter/material.dart';

class home extends StatelessWidget {
  late double _deviceheight, _devicewidth;
  home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    _deviceheight = MediaQuery.of(context).size.height;
    _devicewidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          height: _deviceheight,
          width: _devicewidth,
          padding: EdgeInsets.symmetric(horizontal: _devicewidth * 0.3),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [_title(), _bookrigthwidget()],
              ),
              Align(
                child: _FarmacyImage(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _title() {
    return const Text(
      "Online Vegetable Market",
      style: TextStyle(
          color: Color.fromARGB(255, 14, 13, 13),
          fontSize: 50,
          fontWeight: FontWeight.bold),
    );
  }

  Widget _FarmacyImage() {
    return Container(
      width: _devicewidth * 0.7,
      height: _deviceheight * 0.4,
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage("assets/images/final1.png"),
        ),
      ),
    );
  }

  Widget _ItemDropdown() {
    return Customdropdownbuttonclass(
        ['Tomato', 'Brinjal', 'Raddish'], _devicewidth);
  }

  Widget _info() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Customdropdownbuttonclass(
            ['Nizamabad', 'Hyderabad'], (_devicewidth * 0.15)),
        Customdropdownbuttonclass(
            ['1', '2', '3', '4', '5'], (_devicewidth * 0.1)),
      ],
    );
  }

  Widget _bookrigthwidget() {
    return Container(
      height: _deviceheight * 0.25,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [_ItemDropdown(), _info(), _button()],
      ),
    );
  }

  Widget _button() {
    return Container(
      margin: EdgeInsets.only(bottom: _deviceheight * 0.005),
      width: _devicewidth,
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(200)),
      child: MaterialButton(
        onPressed: () {},
        child: Text(
          'Order now',
          style: TextStyle(
              color: Color.fromARGB(255, 238, 229, 229),
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
