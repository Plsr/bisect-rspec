require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    user = User.new(email: 'test@example.com', password: 'letmein')
    expect(user.valid?).to be(true)
  end

  it 'is not valid without email' do
    user = User.new(password: 'letmein')
    expect(user.valid?).to be(false)
  end
end
