#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ Salon Shop ~~~~~\n"

SERVICES(){
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  echo "Welcome to My Salon, how can I help you?" 

  AVAILABLE_SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")

  echo "$AVAILABLE_SERVICES" | while read SERVICE_ID BAR NAME
  do
    echo "$SERVICE_ID) $NAME"
  done

  read SERVICE_ID_SELECTED

  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
    SERVICES "I could not find that service. What would you like today?"
  else

    HAVE_SERVICE=$($PSQL "SELECT service_id FROM services WHERE service_id=$SERVICE_ID_SELECTED")

    if [[ -z HAVE_SERVICE ]]
    then
      SERVICES "I could not find that service. What would you like today?"
    else

      # get customer info
      echo -e "\nWhat's your phone number?"
      read CUSTOMER_PHONE

      HAVE_CUSTOMER=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

      # if customer doesn't exist
      if [[ -z $HAVE_CUSTOMER ]]
      then
        # get new customer name
        echo -e "\nWhat's your name?"
        read CUSTOMER_NAME

        # insert new customer
        INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')") 
      fi

      # get customer_id
      CUST_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

      # get customer name
      CUST_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

      # get service name
      SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")

      # formatted service name and customer name
      SERVICE_NAME_FORMATTED=$(echo $SERVICE_NAME | sed 's/\s//g' -E)
      CUSTOMER_NAME_FORMATTED=$(echo $CUST_NAME | sed 's/\s//g' -E)
      
      # get service time
      echo -e "\nWhat time would you like your $SERVICE_NAME_FORMATTED, $CUSTOMER_NAME_FORMATTED?"
      read SERVICE_TIME

      # insert service salon
      INSERT_RENTAL_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES ($CUST_ID, $HAVE_SERVICE, '$SERVICE_TIME')")

      echo -e "\nI have put you down for a $SERVICE_NAME_FORMATTED at $SERVICE_TIME, $CUSTOMER_NAME_FORMATTED."
    fi
  fi
}

SERVICES