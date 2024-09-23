# frozen_string_literal: true

class Alert::Component < ApplicationViewComponent
  ALERT_TYPES = {
    info: 'alert-info',
    success: 'alert-success',
    warning: 'alert-warning',
    danger: 'alert-danger',
    error: 'alert-error'
  }.freeze

  param :text, default: proc { 'Hello!' }
  option :type, default: proc { 'info' }
  option :timer, default: proc { 5000 } # 5 seconds

  private

  def alert_type
    return 'alert-info' if type.nil?

    ALERT_TYPES[type.to_sym]
  end

  def alert_icon
    case type
    when 'info'
      'alert-info.svg'
    when 'success'
      'alert-check.svg'
    when 'warning'
      'alert-warning.svg'
    when 'danger', 'error'
      'alert-error.svg'
    end
  end
end
