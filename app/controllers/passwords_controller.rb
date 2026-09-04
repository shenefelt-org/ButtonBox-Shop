# app/controllers/passwords_controller.rb
class PasswordsController < Supabase::Rails::PasswordsController
  # create/edit/update already allow unauthenticated access via the gem parent

  def create
    result = supabase_reset_password(
      email: params[:email],
      redirect_to: edit_password_url(token: "recovery")
    )

    if result.success?
      redirect_to new_session_path,
                  notice: I18n.t("supabase.rails.passwords.reset_sent")
    else
      flash.now[:alert] = result.error.message
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    establish_recovery_session_from_params!
  end

  def update
    # If user landed with token_hash/code still in URL and cookie missing, fix before update
    establish_recovery_session_from_params!

    result = supabase_update_user(password: params[:password])
    if result.success?
      redirect_to new_session_path,
                  notice: I18n.t("supabase.rails.passwords.updated")
    else
      flash.now[:alert] = result.error.message
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def establish_recovery_session_from_params!
    return if authenticated?

    # A) Preferred SSR path: token_hash + type=recovery in query string
    if params[:token_hash].present?
      client = supabase_auth_client
      response = client.verify_otp(
        token_hash: params[:token_hash],
        type: (params[:type].presence || "recovery")
      )
      session = response.respond_to?(:session) ? response.session : nil
      start_new_session_for(session) if session
      return
    end

    # B) Some setups return ?token=...&type=recovery
    if params[:token].present? && params[:type].present?
      result = supabase_verify_otp(
        token: params[:token],
        type: params[:type],
        email: params[:email]
      )
      return if result.success?
      flash.now[:alert] = result.error.message
    end

    # C) PKCE style ?code=... (works mainly if verifier cookie exists; often fails for pure server reset)
    if params[:code].present?
      result = supabase_exchange_code_for_session(code: params[:code], state: params[:state])
      return if result.success?
      flash.now[:alert] = result.error.message
    end
  rescue ::Supabase::Auth::Errors::AuthError => e
    flash.now[:alert] = e.message
  end
end