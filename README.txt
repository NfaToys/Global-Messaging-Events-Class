# Global-Messaging-Events-Class
This includes a small Access VBA Project demonstrates the use of a global class object that uses events to allow forms to communicate with each other.   This allows forms to encapsulate functionality within the form, relieving other forms from needing to know anything about the forms they are talking to. 


Also included is a copy of Richard Rosts Order Entry And Invoicing Access project that's been modified to include a custom global Event Class that enhances the functionality of the project.


Run the project and open the MainForm.
1. Open the CustomerF, then press Orders Button.  Switch between Customers on the CustomersF form using the Record Buttons; the Orders form follows the selected customer.
2. Open the ProductF form.  With the OrderF form open, add a new item to the the ProductF form and see that it automatically appears in the OrderF forms "Add" drop down combo box.  Likewise, delete an item from the ProductF form, and it's automatically removed from the drop down combo box. 
3. these actions were all done by code in the targeted form, not the form where the change was made.   This happens because the form containinng the changes, uses the global event class to send an event to all other listening forms to act on the specific message sent.   This allows the listening form to do a selective Refresh or Requery only on the specific controls that uses the changed data.
