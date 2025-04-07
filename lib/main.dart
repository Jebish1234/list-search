import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Country Search List',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const CountryListScreen(),
    );
  }
}

class CountryListScreen extends StatefulWidget {
  const CountryListScreen({super.key});

  @override
  State<CountryListScreen> createState() => _CountryListScreenState();
}

class _CountryListScreenState extends State<CountryListScreen> {
  final TextEditingController _searchController = TextEditingController();

  final List<String> _allCountries = [
    "India",
    "United States",
    "China",
    "Brazil",
    "Russia",
    "Australia",
    "Canada",
    "Japan",
    "Germany",
    "France",
    "Italy",
    "Mexico",
    "Indonesia",
    "United Kingdom",
    "South Africa",
    "Saudi Arabia",
    "Spain",
    "Turkey",
    "Sweden",
    "Norway",
    "Finland",
    "Poland",
    "Portugal",
    "New Zealand",
    "Netherlands",
    "Switzerland",
    "Argentina",
    "Belgium",
    "Egypt",
    "UAE",
    "Iran",
    "Iraq",
    "Thailand",
    "Vietnam",
    "Malaysia",
    "Philippines",
    "Bangladesh",
    "Nepal",
    "Sri Lanka",
    "Pakistan",
    "Afghanistan",
    "Cuba",
    "Morocco",
    "Kenya",
    "Israel",
    "Ukraine",
    "South Korea",
    "Singapore",
    "Denmark",
    "Ireland"
  ];

  List<String> _filteredCountries = [];

  @override
  void initState() {
    super.initState();
    _filteredCountries = _allCountries;
    _searchController.addListener(_filterCountries);
  }

  void _filterCountries() {
    final query = _searchController.text.toLowerCase();

    setState(() {
      _filteredCountries = _allCountries
          .where((country) => country.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Country Search List'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSearchBar(),
            const SizedBox(height: 20),
            _filteredCountries.isNotEmpty
                ? Expanded(child: _buildCountryList())
                : _buildNoDataWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      controller: _searchController,
      decoration: InputDecoration(
        hintText: 'Search Country...',
        prefixIcon: const Icon(Icons.search),
        filled: true,
        fillColor: Colors.grey.shade200,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildCountryList() {
    return ListView.separated(
      itemCount: _filteredCountries.length,
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        return Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: ListTile(
            leading: const Icon(Icons.flag, color: Colors.blue),
            title: Text(
              _filteredCountries[index],
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
        );
      },
    );
  }

  Widget _buildNoDataWidget() {
    return Expanded(
      child: Center(
        child: Text(
          'No Country Found!',
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey.shade600,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
