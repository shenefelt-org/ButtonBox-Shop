# frozen_string_literal: true

class User < ApplicationRecord
  self.primary_key = :id

  def self.from_supabase(claims)
    find_or_create_by!(id: claims["sub"]) do |u|
      u.email = claims["email"]
    end
  end
end
