# frozen_string_literal: true

require 'rails_helper'

describe Alert::Component do
  let(:text) { 'This is an alert' }
  let(:type) { 'error' }
  let!(:component) { Alert::Component.new(text:, type:) }

  subject { rendered_content }

  it 'renders with custom options' do
    render_inline(component)

    is_expected.to have_css("div.alert-#{type}")
    is_expected.to have_text(text)
  end

  it 'renders with default options' do
    render_inline(Alert::Component.new)

    is_expected.to have_css('div.alert-info')
    is_expected.to have_text('Hello!')
  end
end
