plugin_lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(plugin_lib) unless $LOAD_PATH.include?(plugin_lib)
Rails.autoloaders.main.ignore(plugin_lib) if defined?(Rails) && Rails.respond_to?(:autoloaders) && Rails.autoloaders.main

require 'redmine_revision_branches/git_adapter_patch'
require 'redmine_revision_branches/mercurial_adapter_patch'
require 'redmine_revision_branches/repositories_helper_patch'

Redmine::Plugin.register :redmine_revision_branches do
  name 'Revision Branches'
  author 'Thomas Leishman'
  description 'The Redmine Revision Branches plugin adds branch information to the revisions page, specifically for git.'
  version '0.3.2'
  url 'https://github.com/tleish/redmine_revision_branches/'
  author_url 'https://github.com/tleish'
  settings :default => { display_under_single_revision: true, display_under_associated_revisions: false }, :partial => 'redmine_revision_branches/settings'
end
