[source](https://stackoverflow.com/questions/79022036/how-do-i-use-angular-cli-inside-a-dockerized-app)

# Problem
When launching the container, OP gets the error `command [ng] not recognized`<br>
That is because they're using `CMD ['ng']` instead of `CMD ["ng"]`