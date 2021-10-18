# HomeTime Simple Reservation Service
   This project was created to fulfill hometime engineering interviews.
   
   This project was built on:
   * Rails 6.1.4.1
   * ruby 2.5.3p105 (2018-10-18 revision 65156) [x86_64-darwin20]
   * sqlite3
   
   # Getting Started
   To get started with the app, cd into the directory:
   ```sh
   $ cd hometime-reservations
   ```
  Then install the needed gems:
  ```sh
  $ bundle install
  ```
  Run migrations:
  ```sh
  $ rails db:migrate
  ```
  Finally, run the test suite to verify that everything is working correctly:
  ```sh
  $ bundle exec rspec
  ```
  If the test suite passes, you'll be ready to run the app in a local server:
  ```sh
  $ rails server
  ```

  # How to test the application
  You can test it using postman, once the postman open, set url
  ```sh
  $ http://127.0.0.1:3000/api/reservations
  ```
  and method: 
  ```sh
  $ POST
  ```
  then you can place different payload into request body:

  # PAYLOAD 1
  ```
    {
        "reservation_code": "YYY12345678",
        "start_date": "2021-04-14",
        "end_date": "2021-04-18",
        "nights": 4,
        "guests": 4,
        "adults": 2,
        "children": 2,
        "infants": 0,
        "status": "accepted",
        "guest": {
            "first_name": "Wayne",
            "last_name": "Woodbridge",
            "phone": "639123456789",
            "email": "wayne_woodbridge@bnb.com"
        },
        "currency": "AUD",
        "payout_price": "4200.00",
        "security_price": "500",
        "total_price": "4700.00"
    }
  ```

  # PAYLOAD 2
  ```
    {
        "reservation": {
            "code": "XXX12345678",
            "start_date": "2021-03-12",
            "end_date": "2021-03-16",
            "expected_payout_amount": "3800.00",
            "guest_details": {
                "localized_description": "4 guests",
                "number_of_adults": 2,
                "number_of_children": 2,
                "number_of_infants": 0
            },
            "guest_email": "wayne_woodbridge@bnb.com",
            "guest_first_name": "Wayne",
            "guest_last_name": "Woodbridge",
            "guest_phone_numbers": [
                "639123456789",
                "639123456789"
            ],
            "listing_security_price_accurate": "500.00",
            "host_currency": "AUD",
            "nights": 4,
            "number_of_guests": 4,
            "status_type": "accepted",
            "total_paid_amount_accurate": "4300.00"
        }
  }
