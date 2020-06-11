class QuotesController < ApplicationController

  def index
    if params[:author]
      author = params[:author]
      quote = params[:quote]
      @quotes = Quote.search(author)
      json_response(@quotes)
    else
      @quotes = Quote.all
      json_response(@quotes)
    end
  end

  def show
    @quote = Quote.find(params[:id])
    json_response(@quote)
  end

  def create
    @quote = Quote.create!(quote_params)
    json_response(@quote, :created)
    # if @quote.create!(quote_params)
    #   render status: 200, json: {
    #     message: "Created successfully!"
    #   }
    # end
  end

  def update
    @quote = Quote.find(params[:id])
    if @quote.update!(quote_params)
      render status: 200, json: {
        message: "Updated Successfully"
      }
    end
  end

  def destroy
    @quote = Quote.find(params[:id])
    if @quote.destroy
      render status: 200, json: {
        message: "Quote successfully destroyed"
      }
    end
  end

  private

    def quote_params
      params.permit(:author, :quote, :id)
    end

end