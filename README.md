# README

ATM sub service backend on Ruby on rails
Created 1 api for this service


API'S
1. get_money_change (GET) - 
    i) This service should tell us a way to make change for that amount of money.
    ii) On invalid inputs like negative number or string or 0 it will return 400 status code
   
   
   
url for backend -> https://students-registration123.herokuapp.com/


curl command  -> 
curl --location --request GET 'https://students-registration123.herokuapp.com/atm_services/get_money_change?input_amount=106'
   
 
