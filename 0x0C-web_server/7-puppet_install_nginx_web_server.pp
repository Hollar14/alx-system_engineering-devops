#  Nginx should be listening on port 80
#  When querying Nginx at its root / with a GET request (requesting a page) using curl, it must return a page that contains the string Hello World!
#  The redirection must be a “301 Moved Permanently”
#  Your answer file should be a Puppet manifest containing commands to automatically configure an Ubuntu machine to respect above requirements

exec { 'server configuration':
	provider => shell,
	command	=> 'sudo apt-get -y update; sudo apt-get -y install nginx; echo "Hello World!" > /var/www/html/index.html; sudo sed -i "server_name_;/a location /redirect_me {\\n\\treturn 301 https:google.com; listen 80; \\n\\t}\\n" /etc/nginx/sites-available/default; sudo service nginx restart'
}
