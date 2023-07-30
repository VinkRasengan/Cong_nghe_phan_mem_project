import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  static const String id = 'payment';

  final double amountToPay; // The amount to be paid

  PaymentScreen({Key? key, required this.amountToPay}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool isLoading = false; // To track if the payment is in progress

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Total Amount: \$${widget.amountToPay.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: isLoading ? null : _processPayment,
              child: Text('Pay Now'),
            ),
          ],
        ),
      ),
    );
  }

  // Function to simulate the payment process (Replace this with the actual payment gateway integration)
  void _processPayment() async {
    setState(() {
      isLoading = true;
    });

    // Simulate payment processing delay
    await Future.delayed(Duration(seconds: 2));

    // Here you should integrate with a payment gateway
    // For example, use Stripe, PayPal, or any other payment service
    // For this example, we will just display a success message after the delay.

    setState(() {
      isLoading = false;
    });

    _showPaymentSuccessDialog();
  }

  void _showPaymentSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Payment Successful'),
        content: Text('Thank you for your payment.'),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context); // Close the dialog
              Navigator.pop(context); // Close the payment screen
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}
