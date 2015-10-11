require 'rails_helper'

RSpec.describe Emaillink, type: :model do
  it 'default factory is valid' do
    expect(build(:emaillink).valid?).to be_truthy
  end
end
