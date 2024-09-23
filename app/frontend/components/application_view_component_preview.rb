# frozen_string_literal: true

class ApplicationViewComponentPreview < ViewComponentContrib::Preview::Base
  extend Dry::Initializer
  include ApplicationHelper

  self.abstract_class = true

  layout 'application'
end
