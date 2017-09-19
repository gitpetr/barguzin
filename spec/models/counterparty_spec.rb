require 'rails_helper'

RSpec.describe Counterparty, type: :model do
  it 'validates presence of groups_counterparty_id not valid without name' do
    expect(Counterparty.new(groups_counterparty_id: 1)).to_not be_valid
  end

  it 'validates presence of name not valid without groups_counterparty_id' do
    expect(Counterparty.new(name: '1')).to_not be_valid
  end

  it 'vailidates presence of true' do
    gc = GroupsCounterparty.create(name: 'qqq')
    expect(Counterparty.new(name: 'onename', groups_counterparty_id: gc.id)).to be_valid
  end

end
