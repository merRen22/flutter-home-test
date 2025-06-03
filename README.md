# hometest

This project allows you to login and see the user data from the DB. Take a look at it you can use the user `alice@e.com` with password `12345` to login.

## Good practices

While building this project I tried to follow some good practices, like:

- Use of layers to separate concerns
- Dependency injection
- Automation of the serialization and deserialization of data
- Among others

## Improvements

There are some improvements that can be made to this project, like:

- Use of a more robust state management solution (cubit)
- Improve navigation and UX
- Improve error handling
- Test for the repos as well as the services (db)
- Usage of functional programming (fpdart)
- Shared preferences for the user session
- Encryption of the user password in the DB