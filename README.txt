# Global-Messaging-Events-Class

The Events Test project.
This is a small Access VBA Project that demonstrates the use of a global Class module that provides custom events that allows forms to trigger actions within themselves or with each other.   This Class module concept gives the developer the power of designing custom form events.  Forms can easily trigger actions within themselves, or trigger events in other forms to perform their own actions.   A practicle use of this would be a database that has several forms open that share the same data.  When data is changed in one form, ideally you'd want all other forms to update their displays to reflect the change.   This can be done using function calls for each form, but with this approach the code becomes clumsy and hard to maintain when the number of forms sharing data is numerous.   The better way is to use custom Events.  As each form opens it hooks into the Evenet chain of the global Event class.  Then each form sinks and handles the pertinent events for that form.  And when the form closes it unhooks from the event chain.

Also included is a copy of Richard Rosts Order Entry And Invoicing Access project that's been modified to include a custom global Event Class that enhances the functionality of the project.

Run the project and open the MainForm.
1. Open the CustomerF, then press Orders Button.  Switch between Customers on the CustomersF form using the Record Buttons; the Orders form follows the selected customer.

2. Open the ProductF form.  With the OrderF form open, add a new item to the the ProductF form and see that it automatically appears in the OrderF forms "Add" drop down combo box.  Likewise, delete an item from the ProductF form, and it's automatically removed from the drop down combo box. 

3. these actions were all done by code in the targeted form, not the form where the change was made.   This happens because the form containinng the changes, uses the global event class to send an event to all other listening forms to act on the specific message sent.   This allows the listening form to do a selective Refresh or Requery only on the specific controls that uses the changed data.

The Event Tests 
project shows an overly simplified example of how the custom event class allows forms to send messages to each other.
