[source](https://forums.docker.com/t/creating-directory-instead-of-file/143483)

# Problem
OP experiences a problem where requirements.txt is created by Docker as a directory instead of a file

## Solution
There is no problem, jut a general misunderstanding of how Docker, and Python requirements, work
- Create a requirements.txt file with the required packages for the application to run
- Install the requirements to the image using a Dockerfile, not an \Entrypoint script