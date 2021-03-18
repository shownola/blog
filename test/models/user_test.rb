require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  # test "valid user" do
  #   user = User.new(username: 'john', email: 'john@email.com')
  #   assert user.valid?
  # end

  test 'invalid without username' do
    user = User.new(email: 'john@email.com')
    refute user.valid?, 'user is valid without name'
    assert_not_nil user.errors[:username], 'no validation error for name present'
  end

  test 'invalid without email' do
    user = User.new(username: 'john')
    refute user.valid?
    assert_not_nil user.errors[:email]
  end
end
