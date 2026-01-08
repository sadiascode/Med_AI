import 'package:care_agent/common/custom_button.dart';
import 'package:care_agent/features/medicine/screen/medicine_screen.dart';
import 'package:care_agent/features/medicine/widget/custom_checkout.dart';
import 'package:care_agent/features/medicine/widget/custom_pharmacy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  int selectedPharmacyIndex = 0;

  final List<String> pharmacies = [
    'CVS Pharmacy',
    'Rite Aid',
    'Walgreen',
    'Health Mart',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFAF7),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: ( Icon(Icons.arrow_back_ios, color: Color(0xffE0712D), size: 18))),
        title:  Text(
          "Checkout",
          style: TextStyle(
            color: Color(0xffE0712D),
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(13),
          child: Column(
            children: [
              SizedBox(height: 20),
              CustomCheckout(),

              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Delivery Address',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xffFFF0E6),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        '20 Cooper Square, New York, NY 10003, USA',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                    SvgPicture.asset(
                      'assets/edit.svg',
                      width: 16,
                      height: 16,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/bo.svg',
                      width: 20,
                      height: 20,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Select pharmacy',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: List.generate(pharmacies.length, (index) {
                    return CustomPharmacy(
                      pharmacyName: pharmacies[index],
                      isSelected: selectedPharmacyIndex == index,
                      onTap: () {
                        setState(() {
                          selectedPharmacyIndex = index;
                        });
                      },
                    );
                  }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      Icon(Icons.add, color: Color(0xFFE0712D), size: 20),
                      SizedBox(width: 8),
                      Text(
                        'Add pharmacy',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFFE0712D),
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                          decorationColor: Color(0xFFE0712D),
                          decorationThickness: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFE0712D),
                    padding: EdgeInsets.symmetric(vertical: 5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Your order will be redirected to CVS Pharmacy',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50),
              CustomButton(text: "Confirm", onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MedicineScreen()),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
