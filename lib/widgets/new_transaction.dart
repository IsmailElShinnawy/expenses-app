import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleContoller = TextEditingController();
  final amountContoller = TextEditingController();

  final Function addTransaction;

  NewTransaction(this.addTransaction);

  void submitData() {
    final enteredTitle = titleContoller.text;
    final enteredAmount = double.parse(amountContoller.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    addTransaction(
      enteredTitle,
      enteredAmount,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleContoller,
              onSubmitted: (_) => submitData(),
              // onChanged: (value) => titleInput = value,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountContoller,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => submitData(),
              // onChanged: (value) => amountInput = value,
            ),
            FlatButton(
              textColor: Colors.purple,
              onPressed: submitData,
              child: Text('Add transaction'),
            )
          ],
        ),
      ),
    );
  }
}
