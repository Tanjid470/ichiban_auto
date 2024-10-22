# Car Workshop App

## Description

This Flutter application allows users to manage car service bookings, including user authentication, creating bookings, and viewing them in a calendar format.

## Key Features

1. **User Authentication**
   - Implement registration and login functionality (email/password).
   - Use Firebase or a preferred backend for authentication.
   - Different user roles for mechanics and admins.

2. **Create Booking for Car Servicing**
   - Admins can create car service bookings with the following details:
     - **Car Details**: Make, Model, Year, Registration Plate.
     - **Customer Details**: Name, Phone Number, Email.
     - Booking title, start datetime, and end datetime.
     - Assign a mechanic.
   - Save bookings in a database (Firebase or other backend).

3. **Calendar View of Bookings**
   - Integrate a calendar UI component to display all service bookings.
   - Show booking details upon selection.
   - Mechanic's view to display jobs assigned to them.

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/car_workshop_app.git

