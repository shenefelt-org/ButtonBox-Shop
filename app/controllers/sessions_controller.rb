# frozen_string_literal: true

class SessionsController < Supabase::Rails::SessionsController
  # inherit gem create/destroy; do NOT skip CSRF in :web mode

  private

  def after_authentication_url
    root_path
  end
end