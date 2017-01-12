# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  password_digest :string
#  token           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  describe Contact do
    it "is valid with a name, email and password_digest"
    it "is invalid without a name"
    it "is invalid without a email"
    it "is invalid without an password_digest"
    it "is invalid with a duplicate email address"
  end
end
