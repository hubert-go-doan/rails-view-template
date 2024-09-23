# frozen_string_literal: true

class Alert::Preview < ApplicationViewComponentPreview
  # You can specify the container class for the default template
  # self.container_class = "w-1/2 border border-gray-300"

  def default
    component('alert')
  end

  # @param text [String]
  # @param type [String]
  def custom(text: 'Hello!', type: 'error', timer: 3000)
    component('alert', text, type:, timer:)
  end
end
