# Action Cable Examples

A collection of examples showcasing the capabilities of Action Cable.

## Dependencies

You must have redis installed and running on the default port (or configure it in config/redis/cable.yml).

## Starting the servers

1. Run ./bin/setup
2. Run ./bin/cable
3. Run ./bin/rails server
4. Visit http://localhost:3000

## Live comments example

1. Open two browsers with separate cookie spaces (like a regular session and an incognito session). 
2. Login as different people in each browser. 
3. Go to the same message.
4. Add comments in either browser and see them appear real-time on the counterpart screen.
