#### Event tests.accdb #### 
[![Download Access DB](https://img.shields.io/badge/Download-Event_tests.accdb-blue?style=for-the-badge)](https://github.com/NfaToys/Global-Messaging-Events-Class/raw/main/Event%20tests.accdb)


The Events Test project.
This is a small Access VBA project that demonstrates the use of a global class module to provide custom events, allowing forms to trigger actions within themselves or across other forms.

The class module concept empowers developers to design custom form events. Forms can easily initiate actions internally or trigger events in other forms to perform their own tasks.

A practical use case would be a database with multiple open forms sharing the same data. When data is modified in one form, ideally all other forms should update their displays to reflect the change. While this can be achieved using direct function calls to each form, that approach quickly becomes cumbersome and difficult to maintain as the number of shared forms increases.

A better solution is to use custom events. As each form opens, it hooks into the event chain of the global event class. Each form then sinks and handles the events relevant to its context. When a form closes, it cleanly unhooks from the event chain.


#### Order Entry and Invoicing Template with Custom Events_2023-08-23.accdb ####

This is a copy of Richards Order Entry Template example modified with my Global Event Class providing simultanious updates to all open forms sharing similar table data.
