MyAmazon

This is a database to service an eccomerce website

API Reference
Get /users			: Get information on all users
Get /users/<int>	: Get information on specified users
Put /users/<int>	: Change information for the specified user with specified json information
Post /users			: Create a new user with specified json information
DEL /users/<int>	: Delete selected user


Retrospective:
1: How did the project evolve over time
[answer]: The main change was the database design. The initial relation diagram was not fully thought out

Did you choose to use an ORM or raw SQL? Why?
[answer]: Chose to use ORM, easier to implement

What future improvements are in store, if any?
[answer]: Code out the remaining endpoints.  Saw some difficiencies in normalization, and will try to improove that.
