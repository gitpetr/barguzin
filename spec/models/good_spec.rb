require 'rails_helper'

RSpec.describe Good, type: :model do
  it 'validates presence of name not valid' do
    expect(Good.new(comment: 'la la la')).to_not be_valid
  end

  it 'validates presence of name is valid' do
    expect(Good.new(name: 'bottle')).to be_valid
  end

end
