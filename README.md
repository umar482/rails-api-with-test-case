

## Table of Contents

- 1. Description
- 2. Running the Project
- 3. Design Decisions and Constraints
   - Model Classes
   - Business Rules
   - API Design
- 4.Testing Requirements
   - Requirement 01 - Set Offset Value API
   - Requirement 02 - Store Temperature Reading API
   - Requirement 03 - Get Temperature Reading History List API
   - Requirement 04 - Send User Email For High Temperature
- 5. Algorithms
   - Actual Temperature Calculation
   - Send Email to User
- 6. Test Cases
   - Models Test Coverage
   - API Requests Test Coverage
- 7. Developer Notes


# Body Temperature Measurement System


## 1. Description

Users can own any gear/device for their health monitoring. Mainly, it will check and assess their
body temperature. We can do calibration of measured temperature using the offset value of the
gear device.

Once we have the user's measured body temperatures reaching nearby a set threshold, an
email will be sent to the user.

## 2. Running the Project

 - Extract the zip file containing the code.
 - Import the Postman API collection (Import > Link)
	    Link: https://www.getpostman.com/collections/40f9da3845fb583ff9ab**
 - The project requires **Rails (6.1.4.1)** and **Ruby (2.7.0)**
 - After extracting the project and importing the Postman API collection, run the below
    commands in order

```
bundle install
yarn
rails db:setup
rails server
``` 
 - The project will start running locally. You can start testing each API.
 - Run the `rspec` command to test all cases.

**Note:** The seed file will make gears, dummy temperaturereadings, and a user.

## 3. Design Decisions and Constraints

### Model Classes

 - Gear (id, name, offset_value): Gear can be any devicethat a user can wear, such as a smartwatch, health band, etc.
 - User (id, name, gear_id): The user will wear the gearto have his/her body temperature measured by it.
 - TemperatureReading (id, user_id, body_temp, actual_temp):All the recorded temperature readings are stored in this model. Body_temp is passed as a param (from the device), and actual_temp is calculated by calibrationwith the offset value.
   
   **Note:** For simplicity, I have set a constraint thatone user can only wear one watch at a time.
   


### Business Rules

 - A user can have one gear device.
 - A user can have multiple temperature readings.
 - A temperature reading belongs to a user.
 - A gear belongs to a user.

### API Design

I have made the restful API for this assessment in rails using my API boilerplate long ago. You
can view my API boilerplate from my GitHub account.

 - [umar482/rails-api-boilerplate](https://github.com/umar482/rails-api-boilerplate)

**API Main Components:**
 - **Respondable:** It handles all the Restful CRUD operations.The code is generic.
All you need is to make any resource controller and define its parameters.
 - **Error Handler :** The error handler will cover all typesof errors during Restful APIcalls.


**Note:** Using my Rails API boilerplate, all the CRUDoperations of any resource can be
implemented within seconds. However, I have only generated routes for the three APIs required
in the technical assessment. You can add more routes for remaining CRUD operations in
**api_v1.rb** file. Adding the routes is enough to runthe CRUD for Restful resources.

## 4. Testing Requirements

### Requirement 01 - Set Offset Value API

The offset value of the Gear is used for performing the calibration in the measured body
temperature.


### Requirement 02 - Store Temperature Reading API

The gear device will record the body temperature reading of the user, which will be stored using
this API.


### Requirement 03 - Get Temperature Reading History List API

Using this API, a user can request the system to get the list of previously taken body
temperatures.

**Note:** You can optionally send offset and limit paramsfor **faster API performance.
(Pagination)**


### Requirement 04 - Send User Email For High Temperature

The previous five temperature readings are taken and compared with a threshold whenever the
device measures a temperature reading. If the average body temperature is equal to or higher
than the threshold, an email is sent to the user using the **temperature_readings#notify_user**
method.

## 5. Algorithms

The main algorithms are explained below:


### Actual Temperature Calculation

 - A request is sent to create the temperature reading for a user using
TemperatureReadings#create
 - The temperature reading object is initialized.
 - After initializing, an ActiveRecord callback is generatedto set the actual temperature for
the object.
 - The method returns if the user is not found or the measured body temperature is
missing.
 - But, if both are present, the body temperature value is added with the gear’s offset value
to calculate the actual temperature value.
 - Once done, the temperature reading object is saved with the actual temperature
calculation.

**Note:** Actual temperature is calculated as **body temperature** + **offset value of the gear.**

### Send Email to User

 - A request is sent to create the temperature reading for a user using
TemperatureReadings#create
 - After creating the request, the temperature_readings#notify_user method runs.
 - It calls user.temperature_high? method to check ifthe user's last five body temperature
readings are near the set threshold of 37.5 degrees centigrade.
 - user.temperature_high?: calculates the average actualtemperature of a user by
summing the last 5 actual temperatures and dividing the result by 5.
 - If the returned result is true, an email is sent to the user using UserMailer.warn_user
method that uses the SendGrid gem to send out theemails.
**Note:** Please set the SendGrid credentials followingthe **.env-template** file to test the email functionality. Do let me know if you face any problems regarding this.

## 6. Test Cases

I have used the **RSpecs** gem to test the API requestsand model validations. Below are the test
coverage details:

### Models Test Coverage


**Gear**
 - Validations of offset_value to be present and numeric.
 -  Factory bot object creation test.

**User**

 - Factory bot object creation test.
 -  Associations validations with Gear and TemperatureReading. 
 - Unit test for higher and lower actual temperature from the threshold.

**TemperatureReading**

 -  Validations of actual_temp and body_temp to be presentand numeric.
 -  Associations validations with User. 
 - Factory bot object creation test.

### API Requests Test Coverage

`PUT /api/v1/gears/:id`

 - Request with valid params.
 -  Request with invalid params.
 - Request with missing params.

`POST /api/v1/temperature_readings`

 -  Request with valid params.
 - Request with invalid params.
 - Request with missing params.
 -  Request with body_temp not in range.

`GET /api/v1/users/:user_id/temperature_readings`

 - Request with the valid user id.
 - Request with the invalid user id.

## 7. Developer Notes

 - I have tried to fulfil the requirements in the most minimalist way possible.
 - If anything is missing from the requirements or any additional functionality is required,
please let me know.
 - Email: umarmuhammad3767@gmail.com

