class QuotesController < ApplicationController
  before_action :set_quote, only: %i[show edit update destroy]
  before_action :set_customers, only: %i[new edit create update]

  def index
    @quotes = Quote.includes(:customer).order(created_at: :desc)
  end

  def new
    @quote = Quote.new
  end

  def create
    @quote = Quote.new(quote_params)

    if @quote.save
      QuoteMailer.quote_created(@quote).deliver_now
      redirect_to quote_path(@quote), notice: "Quote created and emailed.", status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    # 1. Intercept email resend FIRST so quote_params is never invoked
    if params[:resend_email].present?
      QuoteMailer.quote_created(@quote).deliver_now
      return redirect_to quote_path(@quote), notice: "Quote email resent to #{@quote.customer.email}.", status: :see_other
    end

    # 2. Standard update flow (uses update instead of update! to catch validation errors gracefully)
    if @quote.update(quote_params)
      redirect_to quote_path(@quote), notice: "Quote #{@quote.quote_number.presence || "QT-#{@quote.id}"} updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @quote.destroy
    redirect_to quotes_path, notice: "Quote deleted successfully.", status: :see_other
  end

  private

  def set_quote
    @quote = Quote.find(params[:id])
  end

  def set_customers
    @customers = Customer.order(:first_name)
  end

  def quote_params
    params.require(:quote).permit(:approved, :total_amount, :customer_id)
  end
end