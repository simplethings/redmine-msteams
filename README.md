# Microsoft Teams chat plugin for Redmine

This plugin posts updates to issues and wiki pages in your Redmine installation to a Microsoft Teams channel. 

The code is heavily based on the [redmine-slack](https://github.com/sciyoshi/redmine-slack) plugin from [sciyoshi](https://github.com/sciyoshi).
So if you prefer Slack over MS Teams just use his plugin!

This is the very first release - it's more a proof of concept and not really well tested (pretty close to not at all!).
The notifications are still pretty ugly and the code is probably a mess, too. I'm not a ruby programmer at all - so a lot of stuff is not done the right/ruby way. But it's works. At least with some simple test issues ;-)

Nevertheless improvements are welcome - even if you just want to fix the coding style! Just send a pull request.

## Installation

From your Redmine plugins directory, clone this repository as `redmine_msteams` (note
the underscore!):

    git clone https://github.com/simplethings/redmine-msteams.git redmine_msteams

You will also need the `httpclient` dependency, which can be installed by running

    bundle install

from the plugin directory.

Restart Redmine, and you should see the plugin show up in the Plugins page.
Under the configuration options, set the Microsoft Teams Webhook URL to the URL for an
Incoming WebHook connector in Teams.

## Customized Routing

You can also route messages to different channels on a per-project basis. To
do this, create a project custom field (Administration > Custom fields > Project)
named `Teams URL`. If no custom channel is defined for a project, the parent
project will be checked (or the default will be used). To prevent all notifications
from being sent for a project, set the custom channel URL to `-` (or anything not empty and not starting with `http`).

## Missing Features / Work in progress

We just started using MS Teams - and this is a quick shot to get a simple redmine integration.
If it works out I would like to add some improvements to this plugin

* Make the messages nicer and easier to read
* User-Images would be nice, too
* Color depending on priority
* Add some filtering (ie. just notify issues not assigned to anybody)
* Don't post the project name if you use a custom channel for the project (doesn't make sense)
* ...
