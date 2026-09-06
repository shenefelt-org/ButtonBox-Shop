# frozen_string_literal: true

class SessionsController < Supabase::Rails::SessionsController
  # inherit gem create/destroy; do NOT skip CSRF in :web mode
  def destroy
    # Clear the session (e.g., Rails 8 built-in auth)
    terminate_session

    # Explicitly pass status: :see_other for Turbo
    redirect_to login_path, status: :see_other, notice: "L8R G8R"
  end

  private

  # direct to stored location if user was prompted to login along their path to view something
  # or go to base dn if no path
  def after_authentication_url
    stored_location_for_redirect || root_path
  end

end