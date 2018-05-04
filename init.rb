require 'redmine'
require 'redmine_msteams/listener'

Redmine::Plugin.register :redmine_msteams do
  name 'Redmine Microsoft Teams'
  author 'Sebastian Wahl'
  url 'https://github.com/simplethings/redmine-msteams'
  author_url 'http://www.simplethings.de'
  description 'Microsoft Teams chat integration'
  version '0.2.0'

  requires_redmine :version_or_higher => '3.3.0'

  settings :default => { 'display_watchers' => 'no' },
           :partial => 'settings/msteams_settings'
end
