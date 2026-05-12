class DonationsController < ApplicationController
  def new
    @project = Project.find(params[:project_id])
    @donation = @project.donations.build
  end

  def create
    @project = Project.find(params[:project_id])
    tx_code = "DON-#{rand(10000..99999)}#{('A'..'Z').to_a.sample}"
    
    donation_params = params.require(:donation).permit(:original_amount, :original_currency).merge(transaction_code: tx_code)
    
    user = Current.session.user 
    processor = DonationProcessor.new(@project, user, donation_params)

    if processor.process!
      redirect_to project_path(@project), notice: t('donations.success')
    else
      @donation = processor.donation
      flash.now[:alert] = t('donations.error')
      render :new, status: :unprocessable_entity
    end
  end
end