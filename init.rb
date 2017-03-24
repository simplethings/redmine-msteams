require 'redmine'

require_dependency 'redmine_msteams/listener'

Redmine::Plugin.register :redmine_msteams do
	name 'Redmine Microsoft Teams'
	author 'Sebastian Wahl'
	url 'https://github.com/simplethings/redmine-msteams'
	author_url 'http://www.simplethings.de'
	description 'Microsoft Teams chat integration'
	version '0.1'

	requires_redmine :version_or_higher => '0.8.0'

	settings \
		:default => {
			'display_watchers' => 'no'
		},
		:partial => 'settings/msteams_settings'
end
