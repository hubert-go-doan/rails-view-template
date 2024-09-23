# frozen_string_literal: true

class Card::Component < ApplicationViewComponent
  option :title, default: proc {}
  renders_one :actions
end
