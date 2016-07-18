Coding Challenge for New Relic

Environment.
  Rails Version 5
  Ruby version 2.3.1

Set up.
  commmand line:
    bundle install (note .rvmrc in app root)
    rake db:create
    rake db:migrate
    rake db:fixtures:load (this creates 2 sample orgs and several server events per org)
    rails s


Sample urls to see app in operation:
Submit an event to log
(note its a get so can run it from browser, have a long reason for using get instead of post, ask me in interview)
http://localhost:3000/events/log_it?host_name=www.stage.org1.com;host_action=server_reboot

Submit a request to view the last 20 events for org report with org id 1 in html.
http://localhost:3000/events/events_for_org?id=1&count=20

Request last <count> events for org in json
http://localhost:3000/events/events_for_org.json?count=20&id=1

Request last <count> events for host in html
http://localhost:3000/events/events_for_host?count=20&host_name=www.dev.org1.com

Request last <count> events for host in json
http://localhost:3000/events/events_for_host.json?count=20&host_name=www.dev.org1.com

sample test script to show update
  show before
   http://localhost:3000/events/events_for_host?count=20&host_name=www.dev.org1.com
  update with new event
   http://localhost:3000/events/log_it?host_name=www.dev.org1.com;host_action=server_error
  show after update
   http://localhost:3000/events/events_for_host?count=20&host_name=www.dev.org1.com
  see after update in json
   http://localhost:3000/events/events_for_host.json?count=20&host_name=www.dev.org1.com
  see org view after update
   http://localhost:3000/events/events_for_org?id=1&count=20


test case:
  setup:
    rake db:test:prepare RAILS_ENV=test
    rake db:fixtures:load RAILS_ENV=test
    rake test TEST=test/controllers/event_test.rb
