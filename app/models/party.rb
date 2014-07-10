# == Schema Information
#
# Table name: parties
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  auth_statement :string(255)
#  description    :text
#  created_at     :datetime
#  updated_at     :datetime
#

class Party < ActiveRecord::Base
  include FriendlyId
  def self.slug_candidate; :name; end
  friendly_id slug_candidate, :use => [:slugged, :history]
  include FriendlyIdHelper

  validates_presence_of :name
  validates_uniqueness_of :name
  validates_presence_of :auth_statement

  has_many :reps
  has_many :rep_users, through: :reps, source: :user

  def slug_candidate
    :name
  end

  def invitations
    Invitation.to_join_party(self)
  end

  def pending_invitations
    invitations.where(accepted_at: nil)
  end

  def full_name
    "The #{name}"
  end
end
