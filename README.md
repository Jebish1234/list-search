# Country List Search App 🌍


## Features

- Display List of 50 Countries
- Stylish Search Bar with Shadow & Rounded Corners
- Filter Countries as User Types
- Clean Card Design for Each Country
- Empty State Message if No Country Found
- Responsive and Modern UI Design

---

## Tools & Technologies Used

| Tool | Purpose |
|------|---------|
| Flutter | UI Development |
| Dart | Programming Language |
| Material Design | UI Components |
| Visual Studio Code | Code Editor |


---

## Approach

- Used StatefulWidget for managing the state.
- Implemented `TextEditingController` to handle the search input.
- Filtered the list of countries dynamically using `.where()`.
- UI designed using Material Design principles.
- Used `Card` widget for better presentation.
- Included search bar with padding, rounded borders, and subtle shadows.

---

## Assumptions

- Static list of 50 countries used (dummy data).
- Real-time filtering required.
- Case-insensitive search.
- Display "No Country Found" when search result is empty.

---

## How to Run

Make sure Flutter SDK is installed.

Run the following commands:

```bash
flutter pub get
flutter run


