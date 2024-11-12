# Customer & Inventory Management App

## Table of Contents
- [Project Overview](#project-overview)
- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Project Structure](#project-structure)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Project Overview
The Customer & Inventory Management App is a versatile mobile application designed to help businesses manage customer transactions, track inventory, and handle deferred payments. The app provides an efficient way to record customer details, manage products, monitor balances and payments, and streamline deferred payment management.

## Features
- **Customer Management**: Add, update, and view customer details.
- **Inventory Management**: Add, update, and view product details.
- **Transaction Management**: Record and track customer transactions.
- **Deferred Payment Tracking**: Manage and monitor outstanding balances.

## Requirements
- Flutter SDK (latest version)
- Visual Studio Code or Android Studio
- Dart Language

## Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/your_username/customer_inventory_management_app.git
   ```
2. Change directory:
   ```bash
   cd customer_inventory_management_app
   ```
3. Get the dependencies:
   ```bash
   flutter pub get
   ```
4. Run the app:
   ```bash
   flutter run
   ```

## Project Structure
```plaintext
lib/
├── core/
│   ├── constants/
│   │   ├── app_colors.dart
│   │   ├── app_text_styles.dart
│   │   └── app_constants.dart
│   ├── errors/
│   │   └── failures.dart
│   └── utils/
│       └── input_validator.dart
├── data/
│   ├── datasources/
│   │   └── local/
│   │       ├── customer_local_datasource.dart
│   │       ├── inventory_local_datasource.dart
│   │       └── transaction_local_datasource.dart
│   ├── models/
│   │   ├── customer_model.dart
│   │   ├── inventory_model.dart
│   │   └── transaction_model.dart
│   └── repositories/
│       ├── customer_repository_impl.dart
│       ├── inventory_repository_impl.dart
│       └── transaction_repository_impl.dart
├── domain/
│   ├── entities/
│   │   ├── customer.dart
│   │   ├── inventory.dart
│   │   └── transaction.dart
│   ├── repositories/
│   │   ├── customer_repository.dart
│   │   ├── inventory_repository.dart
│   │   └── transaction_repository.dart
│   └── usecases/
│       ├── customer/
│       │   ├── add_customer.dart
│       │   ├── get_customers.dart
│       │   └── update_customer.dart
│       ├── inventory/
│       │   ├── add_product.dart
│       │   ├── get_products.dart
│       │   └── update_product.dart
│       └── transaction/
│           ├── add_transaction.dart
│           └── get_transactions.dart
├── presentation/
│   ├── bloc/
│   │   ├── customer/
│   │   │   ├── customer_bloc.dart
│   │   │   ├── customer_event.dart
│   │   │   └── customer_state.dart
│   │   ├── inventory/
│   │   │   ├── inventory_bloc.dart
│   │   │   ├── inventory_event.dart
│   │   │   └── inventory_state.dart
│   │   └── transaction/
│   │       ├── transaction_bloc.dart
│   │       ├── transaction_event.dart
│   │       └── transaction_state.dart
│   ├── pages/
│   │   ├── home/
│   │   │   ├── home_page.dart
│   │   │   └── widgets/
│   │   │       ├── customer_list_item.dart
│   │   │       └── filter_tabs.dart
│   │   ├── inventory/
│   │   │   ├── add_inventory_page.dart
│   │   │   ├── inventory_page.dart
│   │   │   └── widgets/
│   │   │       ├── product_form.dart
│   │   │       └── product_list_item.dart
│   │   ├── transaction/
│   │       ├── add_transaction_page.dart
│   │       ├── transaction_page.dart
│   │       └── widgets/
│   │           ├── customer_selector.dart
│   │           └── product_selector.dart
│   └── widgets/
│       ├── custom_button.dart
│       ├── custom_text_field.dart
│       └── loading_indicator.dart
├── injection_container.dart
└── main.dart
```

## Usage
1. **Home Screen**: Main screen for customer management with search, filters, and payment status indicators.
2. **Inventory Setup Screen**: Allows the business to configure various products with pricing based on type and size.
3. **Add Transaction Screen**: Records transactions using inventory data, with options for custom pricing, quantity input, and payment tracking.

### Adding a Customer
- Navigate to the Home Screen
- Tap the "+" button to open the Add Customer page
- Fill in the customer details and tap "Add Customer"

### Adding an Inventory Item
- Navigate to the Inventory Setup Screen
- Tap the "+" button to open the Add Inventory page
- Fill in the product details and tap "Add Product"

### Adding a Transaction
- Navigate to the Transactions Screen
- Tap the "+" button to open the Add Transaction page
- Select the customer, products, and enter the required details
- Tap "Add Transaction"

## Contributing
1. Fork the repository
2. Create a new branch (`git checkout -b feature-branch`)
3. Make your changes and commit (`git commit -m 'Add some feature'`)
4. Push to the branch (`git push origin feature-branch`)
5. Create a new Pull Request

## License
This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.

