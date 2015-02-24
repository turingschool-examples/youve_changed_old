##Prerequisites##

Make sure you have redis running.

Don't forget to start sidekiq: `bundle exec sidekiq -q default -q mailers`

Start your rails server.

If you want to the Sidekiq view, checkout `http://localhost:3000/sidekiq`.
