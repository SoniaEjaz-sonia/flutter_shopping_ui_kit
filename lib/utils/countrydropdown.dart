import 'package:country_pickers/countries.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/utils/typedefs.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'dropdownutil.dart';

///Provides a customizable [DropdownButton] for all countries
class CountryPickerDropdown extends StatefulWidget {
  const CountryPickerDropdown({
    super.key,
    this.itemFilter,
    this.itemBuilder,
    this.initialValue,
    this.onValuePicked,
  });

  /// Filters the available country list
  final ItemFilter? itemFilter;

  ///This function will be called to build the child of DropdownMenuItem
  ///If it is not provided, default one will be used which displays
  ///flag image, isoCode and phoneCode in a row.
  ///Check _buildDefaultMenuItem method for details.
  final ItemBuilder? itemBuilder;

  ///It should be one of the ISO ALPHA-2 Code that is provided
  ///in countryList map of countries.dart file.
  final String? initialValue;

  ///This function will be called whenever a Country item is selected.
  final ValueChanged<Country>? onValuePicked;

  @override
  State<CountryPickerDropdown> createState() => _CountryPickerDropdownState();
}

class _CountryPickerDropdownState extends State<CountryPickerDropdown> {
  late List<Country> _countries;
  late Country _selectedCountry;

  @override
  void initState() {
    _countries = countryList.where(widget.itemFilter ?? acceptAllCountries).toList();

    if (widget.initialValue != null) {
      try {
        _selectedCountry = _countries.firstWhere(
          (country) => country.isoCode == widget.initialValue!.toUpperCase(),
        );
      } catch (error) {
        throw Exception("The initialValue provided is not a supported iso code!");
      }
    } else {
      _selectedCountry = _countries[0];
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<Country>> items = _countries
        .map((country) => DropdownMenuItem<Country>(
            value: country,
            child: widget.itemBuilder != null ? widget.itemBuilder!(country) : _buildDefaultMenuItem(country)))
        .toList();

    return Row(
      children: <Widget>[
        DropdownButtonHideUnderline(
          child: DropdownButton<Country>(
            isDense: true,
            icon: const Icon(
              FontAwesomeIcons.chevronDown,
              size: 18,
            ),
            onChanged: (value) {
              setState(() {
                _selectedCountry = value!;
                widget.onValuePicked!(value);
              });
            },
            items: items,
            value: _selectedCountry,
          ),
        ),
      ],
    );
  }

  Widget _buildDefaultMenuItem(Country country) {
    return Row(
      children: <Widget>[
        CountryPickerUtils.getDefaultFlagImage(country),
        const SizedBox(
          width: 8.0,
        ),
        Text("(${country.isoCode}) +${country.phoneCode}"),
      ],
    );
  }
}
