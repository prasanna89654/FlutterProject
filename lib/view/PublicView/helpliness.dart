import "package:flutter/material.dart";

class Helpliness extends StatefulWidget {
  const Helpliness({super.key});

  @override
  State<Helpliness> createState() => _HelplinessState();
}

class _HelplinessState extends State<Helpliness> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Helpliness Number"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            children: [
              maketitle(context, "Police", "Contacts"),
              SizedBox(
                height: height * 0.02,
              ),
              makenormal(
                  context, "District Police Office Morang", "021-462158"),
              SizedBox(
                height: height * 0.01,
              ),
              makenormal(context, "police training centre(Administration)",
                  "021 435820"),
              SizedBox(
                height: height * 0.01,
              ),
              makenormal(
                  context, "police training centre(Duty office)", "021 436370"),
              SizedBox(
                height: height * 0.04,
              ),
              maketitle(context, "Ambulance", "Contacts"),
              SizedBox(
                height: height * 0.02,
              ),
              makenormal(
                  context, "Ambulance Services Biratnagar", "9802790755"),
              SizedBox(
                height: height * 0.01,
              ),
              makenormal(context, "Nobel medical college", "021-460736"),
              SizedBox(
                height: height * 0.01,
              ),
              makenormal(context, "Biratnagar Eye Hospital", "021-436360"),
              SizedBox(
                height: height * 0.01,
              ),
              makenormal(context, "City Hospital", "021-533369"),
              SizedBox(
                height: height * 0.01,
              ),
              makenormal(context, "Neuro Cardio and multispeciality Hospital",
                  "021-417484"),
              SizedBox(
                height: height * 0.01,
              ),
              makenormal(context, "Green Cross Hospital", "021-527106"),
              SizedBox(
                height: height * 0.01,
              ),
              makenormal(context, "National kidney Hospital", "021-521955"),
              SizedBox(
                height: height * 0.01,
              ),
              makenormal(context, "Biratnagar Dental Hospital", "021-524273"),
              SizedBox(
                height: height * 0.01,
              ),
              makenormal(context, "Taparia Eye Care Pvt.Ltd", "021-514489"),
              SizedBox(
                height: height * 0.04,
              ),
              maketitle(context, "Hospitals", "Contacts"),
              SizedBox(
                height: height * 0.02,
              ),
              makenormal(context, "Biratnagar Hospital", "021-531042"),
              SizedBox(
                height: height * 0.01,
              ),
              makenormal(context, "Makalu Everest Hospital and research centre",
                  "021-590308"),
              SizedBox(
                height: height * 0.01,
              ),
              makenormal(context, "Koshi Hospital", "021-570103"),
              SizedBox(
                height: height * 0.01,
              ),
              makenormal(context, "Golden Hospital", "021-521809"),
              SizedBox(
                height: height * 0.01,
              ),
              makenormal(context, "Biratnagar Nobel Hospital", "021-460736"),
              SizedBox(
                height: height * 0.01,
              ),
              makenormal(
                  context, "R.K Children Hospital Pvt. Ltd.", "021-441377"),
              SizedBox(
                height: height * 0.01,
              ),
              makenormal(context, "Saptakoshi Hospital and Nursing Home",
                  "021-570002"),
              SizedBox(
                height: height * 0.01,
              ),
              makenormal(context,
                  "Max international Hospital and Trauma Center", "021-521155"),
              SizedBox(
                height: height * 0.01,
              ),
              makenormal(context, "Lifeguard Hospital (Brt)", "021-463177"),
              SizedBox(
                height: height * 0.04,
              ),
              maketitle(context, "Others", "Contacts"),
              SizedBox(
                height: height * 0.02,
              ),
              makenormal(context, "Fire Brigade (Biratnagar Fire Station)",
                  "021-420000"),
              SizedBox(
                height: height * 0.01,
              ),
              makenormal(context, "Nepal Electricity Authority, Biratnagar",
                  "021-525255"),
              SizedBox(
                height: height * 0.01,
              ),
              makenormal(context, "Nepal Red Cross/ Blood Bank", "021-423326"),
              SizedBox(
                height: height * 0.01,
              ),
              makenormal(context, "Nepal telecom, Biratnagar", "021-435900"),
              SizedBox(
                height: height * 0.01,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

maketitle(BuildContext context, String first, String second) {
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;
  return Row(
    children: [
      Text(
        first,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      const Spacer(),
      SizedBox(
        width: width * 0.25,
        child: Text(
          second,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  );
}

makenormal(BuildContext context, String first, String second) {
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;
  return Row(
    children: [
      SizedBox(
        width: width * 0.6,
        child: Text(
          first,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
      const Spacer(),
      SizedBox(
        width: width * 0.25,
        child: Text(
          second,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    ],
  );
}
