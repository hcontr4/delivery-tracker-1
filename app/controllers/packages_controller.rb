class PackagesController < ApplicationController
  def index
    matching_packages = Package.all

    @list_of_packages = matching_packages.order({ :created_at => :desc })
 
    @waiting_on_packages = @list_of_packages.select { |e| !(e.arrived)}
    @received_packages = @list_of_packages.select { |e| e.arrived } 
    # @received_packages = [] if @received_packages.nil?

    render({ :template => "packages/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_packages = Package.where({ :id => the_id })

    @the_package = matching_packages.at(0)

    render({ :template => "packages/show" })
  end

  def create
    the_package = Package.new
    the_package.description = params.fetch("query_description")
    the_package.arrival_date = params.fetch("query_arrival_date")
    the_package.details = params.fetch("query_details")
    the_package.arrived = false
    the_package.user_id = current_user.id

    if the_package.valid?
      the_package.save
      redirect_to("/packages", { :notice => "Added to list." })
    else
      redirect_to("/packages", { :alert => the_package.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_package = Package.where({ :id => the_id }).at(0)

    the_package.arrived = true

    if the_package.valid?
      the_package.save
      redirect_to("/packages/", { :notice => "Package updated successfully."} )
    else
      redirect_to("/packages/", { :alert => the_package.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_package = Package.where({ :id => the_id }).at(0)

    the_package.destroy

    redirect_to("/packages", { :notice => "Package deleted successfully."} )
  end
end
