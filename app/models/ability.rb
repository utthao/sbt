# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(account)
      account ||= Account.new
      if account.admin?
        can :manage, :all
      else
        can [:show, :search], Tour
        can :show, Account
        can :manage, Account, id: account.id
        cannot :index, Account
      end
  end
end
