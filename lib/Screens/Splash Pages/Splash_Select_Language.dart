import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soulknobe_customer/Core/local/local_variables.dart';
import 'Onboarding_Splash.dart';

class Language {
  final String name;
  final int id;

  Language({required this.name, required this.id});
}

class LanguageSelectionWidget extends StatefulWidget {
  final List<Language> languages;

  LanguageSelectionWidget({required this.languages});

  @override
  _LanguageSelectionWidgetState createState() => _LanguageSelectionWidgetState();
}


class _LanguageSelectionWidgetState extends State<LanguageSelectionWidget> {
  Language? _selectedLanguage;
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
       
        body: Padding(
          padding: EdgeInsets.all(scrWidth*0.04),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: scrWidth*0.04,),
                Center(child: SvgPicture.asset("assets/select_date.svg",width: scrWidth*0.8)),
                SizedBox(height: scrWidth*0.04,),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isExpanded = !_isExpanded;
                    });
                  },
                  child: Container(
                    height: scrWidth*0.12,
                    width: scrWidth*1,
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFF263238)),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(_selectedLanguage?.name ?? 'Select Language'),
                        Icon(_isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down),
                      ],
                    ),
                  ),
                ),
                if (_isExpanded)
                  Container(
                    decoration: BoxDecoration(
                    ),
                    child: Column(
                      children: widget.languages.map((Language language) {
                        return RadioListTile<int>(
                          title: Text(language.name),
                          value: language.id,
                          groupValue: _selectedLanguage?.id,
                          onChanged: (int? value) {
                            setState(() {
                              _selectedLanguage = widget.languages.firstWhere((language) => language.id == value);
                              _isExpanded = false; // Close the dropdown
                            });
                          },
                        );
                      }).toList(),
                    ),
                  ),

                SizedBox(height: scrWidth*0.3,),
                InkWell(
                 onTap: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context) =>OnBoardingPage() ,));
                 }, 
                  
                  child: Container(
                    height: scrWidth*0.12,
                    width: scrWidth*1,
                    decoration: BoxDecoration(
                      color: Color(0xFFE15145),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(child: Text("NEXT",style: GoogleFonts.inter(fontWeight: FontWeight.w600,fontSize: scrWidth*0.04,color: Colors.white))),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}