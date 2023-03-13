import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:location/models/habitation.dart';
import 'package:location/share/location_style.dart';
import 'package:location/share/location_text_style.dart';
import 'package:location/views/share/habitation_features_widget.dart';

class HabitationDetails extends StatefulWidget {
  final Habitation _habitation;

  const HabitationDetails(this._habitation, {Key? key}) : super(key: key);

  @override
  _HabitationDetailsState createState() => _HabitationDetailsState();
}

class _HabitationDetailsState extends State<HabitationDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._habitation.libelle),
      ),
      body: ListView(
        padding: EdgeInsets.all(4.0),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.asset(
              'assets/images/locations/${widget._habitation.image}',
              fit: BoxFit.fitWidth,
            ),
          ),
          Container(
            margin: EdgeInsets.all(8.0),
            child: Text(widget._habitation.adresse),
          ),
          HabitationFeaturesWidget(widget._habitation),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  "Inclus",
                ),
              ),
              Expanded(
                  child: Divider(
                height: 36,
                thickness: 1,
                indent: 10,
                endIndent: 10,
                color: Colors.grey,
              )),
            ],
          ),
          _buildItems(),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  "Options",
                ),
              ),
              Expanded(
                  child: Divider(
                height: 36,
                thickness: 1,
                indent: 10,
                endIndent: 10,
                color: Colors.grey,
              )),
            ],
          ),
          _buildOptionsPayantes(),
          _buildRentButton(),
        ],
      ),
    );
  }

  _buildItems() {
    var width = (MediaQuery.of(context).size.width / 2) - 15;

    return Wrap(
      spacing: 2.0,
      children: Iterable.generate(
        widget._habitation.options.length,
        (i) => Container(
          margin: EdgeInsets.all(2.0),
          width: width,
          padding: EdgeInsets.only(left: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(2.0),
                child: Text(widget._habitation.options[i].libelle),
              ),
              Container(
                margin: EdgeInsets.all(2.0),
                child: Text(
                  widget._habitation.options[i].description,
                  style: LocationTextStyle.regularGreyTextStyle,
                ),
              ),
            ],
          ),
        ),
      ).toList(),
    );
  }

  _buildOptionsPayantes() {
    var width = (MediaQuery.of(context).size.width / 2) - 15;
    final format = NumberFormat("#### €");

    return Wrap(
      spacing: 2.0,
      children: Iterable.generate(
        widget._habitation.options.length,
        (i) => Container(
          margin: EdgeInsets.all(2.0),
          width: width,
          padding: EdgeInsets.only(left: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget._habitation.optionspayantes[i].libelle,
                textAlign: TextAlign.start,
              ),
              Text(
                format.format(widget._habitation.optionspayantes[i].prix),
                textAlign: TextAlign.start,
                style: LocationTextStyle.regularGreyTextStyle,
              ),
            ],
          ),
        ),
      ).toList(),
    );
  }

  _buildRentButton() {
    var format = NumberFormat("### €");

    return Container(
      decoration: BoxDecoration(
        color: LocationStyle.backgroundColorPurple,
        borderRadius: BorderRadius.circular(8.0),
      ),
      margin: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              format.format(widget._habitation.prixmois),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            child: ElevatedButton(
              onPressed: () {
                print('Louer Habitation');
              },
              child: Text('Louer'),
            ),
          ),
        ],
      ),
    );
  }
}
