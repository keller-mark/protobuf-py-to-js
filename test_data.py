import sys
import os

# Import from the compiled protobuf classes directory
sys.path.append(os.path.join(os.path.dirname(os.path.abspath(__file__)), "io", "dst"))
# Import the compiled protobuf AddressBook class
import addressbook_pb2

def get_test_data():
    # Set up test data
    address_book = addressbook_pb2.AddressBook()
    person = address_book.people.add()
    person.id = 100
    person.name = "First Last"
    person.email = "first.last@gmail.com"

    phone_number = person.phones.add()
    phone_number.number = "999-999-9999"
    phone_number.type = addressbook_pb2.Person.HOME

    # Serialize and return
    return address_book.SerializeToString()