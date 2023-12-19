import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/medicine.dart';
import '../models/medicines.dart';

class MedicineDetailsCard extends StatelessWidget {
  static const routeName = '/MedicineDetailsCard';

  @override
  Widget build(BuildContext context) {

    final medicineId = ModalRoute.of(context)!.settings.arguments as int;

    final loadedMedicine = Provider.of<MedicinesList>(
      context,
      listen: false,
    ).findById(medicineId);

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context, loadedMedicine),
    );
  }

  Widget contentBox(BuildContext context, Medicine loadedMedicine) {
    return Container(
      height: 500,
      width: 500,
      decoration: BoxDecoration(
        // image: DecorationImage(
        //   image: AssetImage('assets/images/32c3eaaed26fa73510851bc7ffdbf0fa.jpg'), // Replace with your image path
        //   fit: BoxFit.cover,
        // ),
        shape: BoxShape.rectangle,
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: Offset(0, 10),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.network(
            loadedMedicine.imageUrl,
            height: 200, // Adjust the height as needed
            width: 200, // Adjust the width as needed
          ),
          Text(
            'Scientific Name: ${loadedMedicine.scientificName}',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text('Commercial Name: ${loadedMedicine.commercialName}'),
          SizedBox(height: 8),
          Text('Category: ${loadedMedicine.category}'),
          SizedBox(height: 8),
          Text('Manufacturer: ${loadedMedicine.manufacturer}'),
          SizedBox(height: 8),
          Text('Quantity Available: ${loadedMedicine.quantityAvailable.toString()}'),
          SizedBox(height: 8),
          Text('Expiry Date: ${loadedMedicine.expiryDate.toString()}'),
          SizedBox(height: 8),
          Text('Price: ${loadedMedicine.price.toString()}'),
          SizedBox(height: 8),
          ElevatedButton(

            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },

            child: Text('Close'),
            style: ElevatedButton.styleFrom(
              primary: Colors.pink, // Set the background color
              // You can also customize other properties like padding, elevation, etc.
            ),

          ),
        ],
      ),
    );
  }
}