Redmine::Plugin.register :polls do
  name 'Polls plugin'
  author '初めてのプラグイン'
  description 'This is a plugin for Redmine'
  version '0.0.1'

  menu :application_menu, :polls, { controller: 'polls', action: 'index'}, caption: 'Polls'
end
