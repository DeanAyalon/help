[source](https://forums.docker.com/t/unable-to-build-docker-ubuntu-image-on-macos/144647)

# Problem
`RUN apt-get update && apt-get install ...` fails
> Could not reproduce error

----
# Additional Notes
The `RUN apt-get clean && rm -rf ...` step does NOT reduce the size of the Docker image! 
That is because the previous layers are already committed as part of the image, the files exist.
In order not to save unnecessary files, their removal should be done within the same RUN step.