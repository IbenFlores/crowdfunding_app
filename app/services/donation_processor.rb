class DonationProcessor
  def initialize(project, user, donation_params)
    @project = project
    @user = user
    @donation = @project.donations.build(donation_params)
    @donation.user = @user
    @donation.donor_email = @user.email_address

    if @donation.original_amount.present? && @donation.original_currency.present?
      converted = ExchangeRateService.convert(
        @donation.original_amount,
        @donation.original_currency,
        @project.base_currency
      )
      @donation.amount = converted
    end
  end

  def process!
    ActiveRecord::Base.transaction do
      @donation.save!
      new_amount = @project.current_amount + @donation.amount
      @project.update!(current_amount: new_amount)
    end
    true
  rescue ActiveRecord::RecordInvalid => e
    false
  end

  def donation
    @donation
  end
end