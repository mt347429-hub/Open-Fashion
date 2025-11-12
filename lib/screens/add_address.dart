import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:master_ui3/widgets/customer_appbar.dart';
import 'package:master_ui3/widgets/header.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({super.key, this.date});
  final dynamic date;

  @override
  State<AddAddress> createState() => _AddAddressState();

}

class _AddAddressState extends State<AddAddress> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final zipCodeController = TextEditingController();
  final phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    addressController.dispose();
    cityController.dispose();
    stateController.dispose();
    zipCodeController.dispose();
    phoneController.dispose();
    super.dispose();
  }
  @override
  void initState() {
    if(widget.date != null) {
      firstNameController.text = widget.date['first'] ?? "";
      lastNameController.text = widget.date['last'] ?? "";
      addressController.text = widget.date['address'] ?? "";
      cityController.text = widget.date['city'] ?? "";
      stateController.text = widget.date['state'] ?? "";
      zipCodeController.text = widget.date['Zip'] ?? "";
      phoneController.text = widget.date['phone'] ?? "";
    }
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomerAppbar(isblackk: false),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Header(title: "Add Shipping Address"),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          label: 'First name',
                          controller: firstNameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your first name';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: CustomTextField(
                          label: 'Last name',
                          controller: lastNameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your last name';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const Gap(30),
                  CustomTextField(
                    label: 'Address',
                    controller: addressController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your address';
                      }
                      return null;
                    },
                  ),
                  const Gap(30),
                  CustomTextField(
                    label: 'City',
                    controller: cityController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your city';
                      }
                      return null;
                    },
                  ),
                  const Gap(30),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          label: 'State',
                          controller: stateController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter your state';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: CustomTextField(
                          label: 'ZIP Code',
                          controller: zipCodeController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter ZIP code';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const Gap(30),
                  CustomTextField(
                    label: 'Phone Number',
                    controller: phoneController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter your phone number';
                      } else if (!RegExp(r'^\d{10,15}$').hasMatch(value)) {
                        return 'Enter a valid phone number';
                      }
                      return null;
                    },
                  ),
                  const Gap(50),
                  Button(
                    isSvgg: false,
                    title: "Place Order",
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        final data = {
                          'first': firstNameController.text,
                          'last': lastNameController.text,
                          'address': addressController.text,
                          'city': cityController.text,
                          'state': stateController.text,
                          'Zip': zipCodeController.text,
                          'phone': phoneController.text,
                        };
                        Navigator.pop(context, data);
                      }
                    },
                  ),
                  const Gap(70),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
