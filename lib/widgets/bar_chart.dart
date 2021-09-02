import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BarChart extends StatelessWidget {
  final List<double> expenses;
  BarChart({required this.expenses});

  @override
  Widget build(BuildContext context) {
    double mostExpensive = 0;
    expenses.forEach((element) {
      if(element > mostExpensive){
        mostExpensive = element;
      }
    });
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Text(
            'Weekly Spending',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          SizedBox(height: 5.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back),iconSize: 20.0,),
              Text('Aug 30, 2021 - Sep 5, 2021', style: TextStyle(fontSize: 13.0,fontWeight: FontWeight.w600,letterSpacing: 1.2),),
              IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward),iconSize: 20.0,),
            ],
          ),
          SizedBox(height: 30.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Bar(label: 'Sun',amountSpend: expenses[0], mostExpensive: mostExpensive),
              Bar(label: 'Mon',amountSpend: expenses[1], mostExpensive: mostExpensive),
              Bar(label: 'Tue',amountSpend: expenses[2], mostExpensive: mostExpensive),
              Bar(label: 'Wed',amountSpend: expenses[3], mostExpensive: mostExpensive),
              Bar(label: 'Thr',amountSpend: expenses[4], mostExpensive: mostExpensive),
              Bar(label: 'Fri',amountSpend: expenses[5], mostExpensive: mostExpensive),
              Bar(label: 'Sat',amountSpend: expenses[6], mostExpensive: mostExpensive),
            ],
          ),
        ],
      ),
    );
  }
}

class Bar extends StatelessWidget {
  final String label;
  final double amountSpend;
  final double mostExpensive;

  Bar({required this.label, required this.amountSpend, required this.mostExpensive});

  final double maxBarHeight = 150.0;

  @override
  Widget build(BuildContext context) {
    final barHeight = amountSpend/mostExpensive * maxBarHeight;
    return Column(
      children: [
        Text("₹" + amountSpend.toStringAsFixed(2),style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600),),
        SizedBox(height: 5.0,),
        Container(
          height: barHeight,
          width: 18.0,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(6.0),
          ),
        ),
        SizedBox(height: 5.0,),
        Text(label,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
      ],
    );
  }
}

