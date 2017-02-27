class Invite
  include Mongoid::Document
  field :user_email, type: String
  field :referral_mails, type: String
  field :total_shares, type: Integer, default: 0
  field :successful_referrals, type: Integer, default: 0
  field :total_credit, type: Integer, default: 0
  field :credit_remaning, type: Integer, default: 0
end
