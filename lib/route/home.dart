import "package:flutter/material.dart";

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  final List<DropdownMenuItem<String>> measureItems = [];
  final List<String> measures = [];
  final Map<String, List<double>> formulas = {
    "meters":[1,0.001,0,0,3.28084,0.000621371,0,0],
    "kilometers":[1000,1,0,0,3280.84,0.621371,0,0],
    "grams":[0,0,1,0.0001,0,0,0.00220462,0.035274],
    "kilograms":[0,0,1000,1,0,0,2.20462,35.274],
    "feets":[0.3048,0.0003048,0,0,1,0.000189394,0,0],
    "miles":[1609.34, 1.60934,0,0,5280,1,0,0],
    "pounds":[0,0,453.592,0.453592,0,0,1,16],
    "ounces":[0,0,28.3495,0.0283495,3.28084,0,0.0625, 1],
  };
  final Map<String, int> mapOfMeasures = {
    "meters" : 0,
    "kilometers" : 1,
    "grams" : 2,
    "kilograms" : 3,
    "feets" : 4,
    "miles" : 5,
    "pounds" : 6,
    "ounces" : 7
  };
  double resultOfMeasure = 0.0;
  late double valueOfMeasure;
  late String startMeasure;
  late String convertMeasure;

  @override
  void initState() {
    measures.add("meters");
    measures.add("kilometers");
    measures.add("grams");
    measures.add("kilograms");
    measures.add("feets");
    measures.add("miles");
    measures.add("pounds");
    measures.add("ounces");

    valueOfMeasure = 0.0;
    startMeasure = measures[0];
    convertMeasure = measures[0];

    for (int i = 0; i < measures.length; i++) {
      measureItems.add(
        DropdownMenuItem(
          value: measures[i],
          child: Text(measures[i])
        )
      );
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const TextStyle textInputStyle = TextStyle(
      fontSize: 18.0,
      color: Colors.blue
    );
    const TextStyle textLabelStyle = TextStyle(
      fontSize: 18.0,
      color: Colors.blueGrey
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 5.0,
        title: Text("Unit Converter"),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(16.0),
        child: Column(
          children: [
            Flex(
              direction: Axis.horizontal,
              children: [
                Expanded(
                  flex: 4,
                  child: Text(
                  "Number",
                  style: textLabelStyle
                  )
                ),
                Expanded(
                  flex: 8,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Type number"
                    ),
                    style: textInputStyle,
                    onChanged: listenTextField,
                  )
                )
              ]
            ),

            SizedBox(
              height: 8.0
            ),

            Flex(
              direction: Axis.horizontal,
              children: [
                Expanded(
                  flex: 4,
                  child: Text(
                    "From",
                    style: textLabelStyle,
                  )
                ),
                Expanded(
                  flex: 8,
                  child: DropdownButton(
                    isExpanded: true,
                    items: measureItems,
                    onChanged: listenStartMeasure,
                    value: startMeasure
                  )
                )
              ]
            ),

            SizedBox(
              height: 8.0
            ),

            Flex(
              direction: Axis.horizontal,
              children: [
                Expanded(
                  flex: 4,
                  child: Text(
                    "To",
                    style: textLabelStyle,
                  )
                ),
                Expanded(
                  flex: 8,
                  child: DropdownButton(
                    isExpanded: true,
                    items: measureItems,
                    onChanged: listenConvertMeasure,
                    value: convertMeasure
                  )
                )
              ]
            ),

            SizedBox(
              height: 8.0
            ),

            Center(
              child: ElevatedButton(
                onPressed: listenButtonConvert,
                style: ElevatedButton.styleFrom(
                  fixedSize: Size.fromHeight(
                    48.0
                  )
                ),
                child: Text("Convert")
              )
            ),

            SizedBox(
              height: 8.0
            ),

            Center(
              child: Text(
                resultOfMeasure.toString(),
                style: textLabelStyle
              )
            )
          ]
        )
      )
    );
  }

  void listenTextField(String value) {
    double? data = double.tryParse(value);

    if (data != null) {
      valueOfMeasure = data;
    } else {
      valueOfMeasure = 0.0;
    }

    setState(() {});
  }

  void listenStartMeasure(String? value) {
    if (value != null) {
      startMeasure = value;
      setState(() {});
    } else {
      print("Logistic: startMeasure is null.");
    }
  }

  void listenConvertMeasure(String? value) {
    if (value != null) {
      convertMeasure = value;

      setState(() {});
    } else {
      print("Logistic: convertMeasure is null.");
    }
  }

  void listenButtonConvert() {
    int multiplier = mapOfMeasures[convertMeasure]!;
    resultOfMeasure = valueOfMeasure * formulas[startMeasure]![multiplier];
    print(valueOfMeasure);
    print(multiplier);
    print(resultOfMeasure);
    setState(() {});
  }
}
