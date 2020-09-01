# frozen_string_literal: true

require 'codebreaker'
require 'i18n'
I18n.load_path << Dir[File.expand_path('config/locales') + '/*.yml']

require_relative 'console'
require_relative 'states/state'
require_relative 'states/welcome_state'
require_relative 'states/registration_state'
require_relative 'states/menu_state'
require_relative 'states/guess_state'
require_relative 'states/summary_state'
require_relative 'states/save_state'
require_relative 'states/rules_state'
require_relative 'states/stats_state'
require_relative 'states/hint_state'
