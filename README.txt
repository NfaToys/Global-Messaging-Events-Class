#### Event tests.accdb ####

The Events Test project.
This is a small Access VBA project that demonstrates the use of a global class module to provide custom events, allowing forms to trigger actions within themselves or across other forms.

The class module concept empowers developers to design custom form events. Forms can easily initiate actions internally or trigger events in other forms to perform their own tasks.

A practical use case would be a database with multiple open forms sharing the same data. When data is modified in one form, ideally all other forms should update their displays to reflect the change. While this can be achieved using direct function calls to each form, that approach quickly becomes cumbersome and difficult to maintain as the number of shared forms increases.

A better solution is to use custom events. As each form opens, it hooks into the event chain of the global event class. Each form then sinks and handles the events relevant to its context. When a form closes, it cleanly unhooks from the event chain.


#### Order Entry and Invoicing Template with Custom Events_2023-08-23.accdb ####

This is a copy of Richard Rosts Order Entry And Invoicing Access project that's been modified to include a custom global Event Class that enhances the functionality of the project.

Run the project and open the MainForm.
1. Open the CustomerF, then press Orders Button.  Switch between Customers on the CustomersF form using the Record Buttons; the Orders form follows the selected customer.

2. Open the ProductF form.  With the OrderF form open, add a new item to the the ProductF form and see that it automatically appears in the OrderF forms "Add" drop down combo box.  Likewise, delete an item from the ProductF form, and it's automatically removed from the drop down combo box. 

3. these actions were all done by code in the targeted form, not the form where the change was made.   This happens because the form containinng the changes, uses the global event class to send an event to all other listening forms to act on the specific message sent.   This allows the listening form to do a selective Refresh or Requery only on the specific controls that uses the changed data.

The Event Tests 
project shows an overly simplified example of how the custom event class allows forms to send messages to each other.
