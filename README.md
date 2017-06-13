# Action Cable Examples

A collection of examples showcasing the capabilities of Action Cable.

## Dependencies

Docker ([Installation instructions](https://www.docker.com/community-edition))

## Starting the servers

1. Run `docker build --tag actioncable-examples .`
2. Run `docker run --name actioncable-examples --rm -p 3000:3000 -v $(pwd):/rails actioncable-examples`
4. Visit http://localhost:3000

## Live comments example

1. Open two browsers with separate cookie spaces (like a regular session and an incognito session). 
2. Login as different people in each browser. 
3. Go to the same message.
4. Add comments in either browser and see them appear real-time on the counterpart screen.

![Live comments example](/example.gif?raw=true "Live comments example")
