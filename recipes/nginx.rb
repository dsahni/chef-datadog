include_recipe 'datadog::dd-agent'

# Monitor nginx
#
# Assuming you have 2 instances "prod" and "test", you will need to set
# up the following attributes at some point in your Chef run, in either
# a role or another cookbook.
#
# node['datadog']['nginx']['instances'] = [
#   {
#     'nginx_status_url' => "http://localhost:81/nginx_status/",
#     'tags' => ["prod"],
#     'user' => "my_username",
#     'password' => "my_password"
#   },
#   {
#     'nginx_status_url' => "https://localhost:82/nginx_status/",
#     'name' => ['test'],
#     'ssl_validation' => false
#   }
# ]

datadog_monitor 'nginx' do
  instances node['datadog']['nginx']['instances']
  logs node['datadog']['nginx']['logs']
end
