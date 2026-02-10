import 'package:flutter/material.dart';
import '../../../../../core/widgets/app_text_field.dart';

class CreditCardFields extends StatelessWidget {
  final TextEditingController cardNumber;
  final TextEditingController name;
  final TextEditingController expiry;
  final TextEditingController cvv;

  const CreditCardFields({
    super.key,
    required this.cardNumber,
    required this.name,
    required this.expiry,
    required this.cvv,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextField(
          controller: cardNumber,
          label: 'Card Number',
          keyboard: TextInputType.number,
          validator: (v) {
            if (v == null || v.isEmpty) return 'Card number is required';
            if (v.length < 16) return 'Invalid card number';
            return null;
          },
        ),
        const SizedBox(height: 12),
        AppTextField(
          controller: name,
          label: 'Card Holder Name',
          validator: (v) =>
          v == null || v.isEmpty ? 'Name is required' : null,
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: AppTextField(
                controller: expiry,
                label: 'MM/YY',
                validator: (v) {
                  if (v == null || v.isEmpty) return 'Expiry required';
                  if (!RegExp(r'^\d{2}/\d{2}$').hasMatch(v)) {
                    return 'Invalid date';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: AppTextField(
                controller: cvv,
                label: 'CVV',
                keyboard: TextInputType.number,
                validator: (v) {
                  if (v == null || v.isEmpty) return 'CVV required';
                  if (v.length < 3) return 'Invalid CVV';
                  return null;
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}



