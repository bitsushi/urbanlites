class Admin::QuotesController < Admin::BaseController
  def destroy
    @quote = Quote.find(params[:id])
    @quote.destroy
  end
end
