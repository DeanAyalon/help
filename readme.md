[source](https://www.reddit.com/r/docker/comments/1fm5eto/customized_image_tag_while_pulling_a_specific/?share_id=YWf17RR5eGDpxG9r7gLI8&utm_content=1&utm_medium=ios_app&utm_name=ioscss&utm_source=share&utm_term=1)

# Problem
OP wants to use images specified by hash instead of tag, to be sure the version is never changed.
At the same time, OP wants to create a custom tag for the image, so that the image is readable.

## Proposed Solution
inline dockerfile generating a custom image from the given hash
> Not working for OP - Not a configuration problem, compose version perhaps?

## Alternative
`image: image:custom-tag@hash` works for the container instance
**However** 
- The tag used is `custom-tag@hash` instead of just `custom-tag`
- Running `docker image ls` does not show the custom tag