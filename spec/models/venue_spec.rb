# == Schema Information
#
# Table name: venues
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  slug        :string(255)
#  address     :text
#  latitude    :decimal(15, 12)
#  longitude   :decimal(15, 12)
#  description :text
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#  directions  :text
#  display     :boolean         default(FALSE)
#

require 'spec_helper'

describe Venue do
end
