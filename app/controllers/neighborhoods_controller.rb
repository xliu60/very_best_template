class NeighborhoodsController < ApplicationController
  def index
    @neighborhoods = Neighborhood.all

    render("neighborhood_templates/index.html.erb")
  end

  def show
    @neighborhood = Neighborhood.find(params.fetch("id_to_display"))

    render("neighborhood_templates/show.html.erb")
  end

  def new_form
    @neighborhood = Neighborhood.new

    render("neighborhood_templates/new_form.html.erb")
  end

  def create_row
    @neighborhood = Neighborhood.new

    @neighborhood.name = params.fetch("name")

    if @neighborhood.valid?
      @neighborhood.save

      redirect_back(:fallback_location => "/neighborhoods", :notice => "Neighborhood created successfully.")
    else
      render("neighborhood_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @neighborhood = Neighborhood.find(params.fetch("prefill_with_id"))

    render("neighborhood_templates/edit_form.html.erb")
  end

  def update_row
    @neighborhood = Neighborhood.find(params.fetch("id_to_modify"))

    @neighborhood.name = params.fetch("name")

    if @neighborhood.valid?
      @neighborhood.save

      redirect_to("/neighborhoods/#{@neighborhood.id}", :notice => "Neighborhood updated successfully.")
    else
      render("neighborhood_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @neighborhood = Neighborhood.find(params.fetch("id_to_remove"))

    @neighborhood.destroy

    redirect_to("/neighborhoods", :notice => "Neighborhood deleted successfully.")
  end
end
