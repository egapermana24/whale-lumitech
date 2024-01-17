import 'package:flutter/material.dart';

class VehicleSelection extends StatelessWidget {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = ScrollController();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      controller: _scrollController,
      child: Container(
        color: Colors.grey[200],
        child: Row(
          children: [
            GestureDetector(
              // onTap: () => setState(() => _selectedIndex = 0),
              child: _buildVehicleItem(
                imagePath: "assets/images/train.png",
                title: "Train",
                isSelected: _selectedIndex == 0,
              ),
            ),
            GestureDetector(
              // onTap: () => setState(() => _selectedIndex = 1),
              child: _buildVehicleItem(
                imagePath: "assets/images/motor.png",
                title: "Motorcycle",
                isSelected: _selectedIndex == 1,
              ),
            ),
            GestureDetector(
              // onTap: () => setState(() => _selectedIndex = 2),
              child: _buildVehicleItem(
                imagePath: "assets/images/car.png",
                title: "Car",
                isSelected: _selectedIndex == 2,
              ),
            ),
            GestureDetector(
              // onTap: () => setState(() => _selectedIndex = 3),
              child: _buildVehicleItem(
                imagePath: "assets/images/bus.png",
                title: "Bus",
                isSelected: _selectedIndex == 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildVehicleItem({
  required String imagePath,
  required String title,
  required bool isSelected,
}) {
  return Container(
    margin: const EdgeInsets.all(10),
    padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(
      color: isSelected ? Colors.lightBlue[50] : Colors.white,
      borderRadius: BorderRadius.circular(15),
    ),
    child: ListTile(
      leading: Image.asset(imagePath),
      title: Text(title),
    ),
  );
}
