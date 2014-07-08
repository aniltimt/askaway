# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  is_admin               :boolean          default(FALSE)
#  name                   :string(255)      not null
#

class User < ActiveRecord::Base
  include Gravtastic
  # gravtastic size: 64, default: 'http://lorempixel.com/output/cats-q-c-64-64-3.jpg'
  gravtastic size: 64, default: :identicon
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :name

  has_many :questions
  has_many :votes
  has_one :rep

  delegate :party, to: :rep, prefix: false

  def is_rep?
    Rep.exists?(user_id: id)
  end

  def name_and_email
    "#{name} <#{email}>"
  end
end
