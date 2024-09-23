# frozen_string_literal: true

class Button::Preview < ApplicationViewComponentPreview
  # You can specify the container class for the default template
  # self.container_class = "w-1/2 border border-gray-300"

  # @param text [String]
  # @param url [String]
  # @param method [String]
  # @param variant select { choices: [primary, secondary, accent, info, success, warning, error, ghost, link, white] }
  # @param size select { choices: [sm, md, lg] }
  # @param block [Boolean]
  # @param disabled [Boolean]
  # @param outline [Boolean]
  # @param new_tab [Boolean]

  def primary(text: 'hahaha', url: nil, method: nil, variant: :primary,
              size: :sm, block: false, type: :button, disabled: false,
              outline: false, new_tab: false)
    component('button', text, url:, method:, variant:, size:, block:, type:, disabled:, outline:, new_tab:)
  end
end
