# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ResourcesController, type: :controller do
  context 'GET #index' do
    before { get :index }
    it { should respond_with(200) }
  end
  context 'GET #resources_per_survivor' do
    before { get :resources_per_survivor }
    it { should respond_with(200) }
  end
end
