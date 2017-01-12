# == Schema Information
#
# Table name: short_urls
#
#  id           :integer          not null, primary key
#  original_url :string
#  shorty       :string
#  user_id      :integer
#  visits_count :integer          default("0")
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'rails_helper'

RSpec.describe ShortUrl, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
