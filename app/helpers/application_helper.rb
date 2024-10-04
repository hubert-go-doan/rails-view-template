# frozen_string_literal: true

module ApplicationHelper
  include Pagy::Frontend

  ActionView::Base.default_form_builder = FormBuilders::DaisyFormBuilder

  def component(name, *, **, &)
    component = name.to_s.camelize.constantize::Component
    render(component.new(*, **), &)
  end
end
