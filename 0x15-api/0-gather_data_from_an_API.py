#!/usr/bin/python3
"""script using this REST API, for a given employee ID,
returns information about his/her TODO list progress."""
import requests as r
import sys

if __name__ == '__main__':
    url = 'https://jsonplaceholder.typicode.com/'
    user_id = r.get(url + 'users/{}'.format(sys.argv[1])).json()
    to_do = r.get(url + 'todos', params={'userId': sys.argv[1]}).json()
#    print(to_do)
    complete = [title.get("title") for title in to_do if
                 title.get('completed') is True]
    print(complete)
    print("Employee {} is done with tasks({}/{}):".format(user_id.get("name"),
                                                          len(complete),
                                                          len(to_do)))
    [print("\t {}".format(title)) for title in complete]
