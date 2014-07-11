# == Schema Information
#
# Table name: topics
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Topic < ActiveRecord::Base
  has_many :questions, inverse_of: :topic
  has_many :rep_topics
  has_many :reps, through: :rep_topics
  validates_presence_of :name
end
