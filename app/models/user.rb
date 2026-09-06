# frozen_string_literal: true

class User < ApplicationRecord
  self.primary_key = :id

  # enum to generate predicates, backed by column in user table (user_role)
  enum :user_role, {
    super_admin: "SUPER ADMIN",
    admin: "ADMIN"
  }, default: "USER"

  def self.from_supabase(claims)
    find_or_create_by!(id: claims["sub"]) do |u|
      u.email = claims["email"]
    end
  end

  # uses role enum
  def is_admin?
    admin? || super_admin?
  end
end
