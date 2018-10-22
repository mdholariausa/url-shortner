# URL Shortner

You will need `ruby > 2.4.2` and MySQL database

To Launch, do this:

```
setup.sh
rails s
```


### Click Activities

Available under table "shorten_visits"

Schema:-
```
id
short_url
from_ip
user_agent
created_at
```