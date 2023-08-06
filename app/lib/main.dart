import 'package:flutter/material.dart';

class CurrencyConverterApp extends StatefulWidget {
  @override
  _CurrencyConverterAppState createState() => _CurrencyConverterAppState();
}

class _CurrencyConverterAppState extends State<CurrencyConverterApp> {
  double dollarAmount = 0;
  double convertedAmount = 0;
  final TextEditingController _controller = TextEditingController();

  Map<String, double> conversionRates = {
    'USD': 1,    // Conversion rate of 1 USD to USD (Base currency)
    'EUR': 1.1, // Conversion rate of 1 USD to EUR
    'GBP': 1.27, // Conversion rate of 1 USD to GBP
    'KWD': 3.28, // Conversion rate of 1 USD to KWD
    'JPY': 0.0071,  // Conversion rate of 1 USD to JPY
    'CAD': 0.75, // Conversion rate of 1 USD to CAD
    'EGP': 0.033, // Conversion rate of 1 USD to EGP
    'SAR': 0.27, // Conversion rate of 1 USD to SAR
    'AED': 0.27, // Conversion rate of 1 USD to AED
  };

  void convertCurrency() {
    setState(() {
      dollarAmount = double.tryParse(_controller.text) ?? 0;
      convertedAmount = dollarAmount * conversionRates['USD']! / conversionRates[selectedCurrency]!;
    });
  }

  String selectedCurrency = 'USD';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CurrencyConv',
      debugShowCheckedModeBanner: false, // Remove the debug ribbon
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('CurrencyConv'),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blue.shade100, Colors.blue.shade300],
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Enter Amount in USD:',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: _controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'USD',
                    ),
                  ),
                  SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    value: selectedCurrency,
                    items: conversionRates.keys.map((currency) {
                      return DropdownMenuItem<String>(
                        value: currency,
                        child: Text(currency),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedCurrency = value!;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Currency',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: convertCurrency,
                    child: Text('Convert'),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Converted Amount: ${convertedAmount.toStringAsFixed(2)} ${selectedCurrency}',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(CurrencyConverterApp());
}
