# == Schema Information
#
# Table name: packages
#
#  id           :integer          not null, primary key
#  arrival_date :date
#  arrived      :boolean
#  description  :string
#  details      :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer
#
class Package < ApplicationRecord
  belongs_to(:user)

end
