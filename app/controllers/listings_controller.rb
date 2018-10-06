class ListingsController < ApplicationController
  before_action :authenticate_user!
  def index
    @listings = current_user.listings
  end

  def new
    @listing = Listing.new
  end

  def show
    @proposal = Proposal.new
    @proposals = Listing.find(params[:id]).proposals
    @listing = Listing.find(params[:id])
  end

  def create
    @listing = current_user.listings.new(listing_params)
    if @listing.save
      redirect_to listings_path,
        notice: 'Listing was successfully created.'
    else
      redirect_to listings_path,
        alert: "Could not save listing: #{@listing.errors.full_messages.join(', ')}"
    end
  end

  private

  def listing_params
    params.require(:listing).permit(:description, :starting_address, :ending_address, :price, :difficulty, :date, :time, :contact, :stairs, :max_people)
  end
end
