class PersonController < ApplicationController
  def index
    people = Person.all
    render("index.ecr")
  end

  def show
    if person = Person.find params["id"]
      render("show.ecr")
    else
      flash["warning"] = "Person with ID #{params["id"]} Not Found"
      redirect_to "/people"
    end
  end

  def new
    person = Person.new
    render("new.ecr")
  end

  def create
    person = Person.new(person_params.validate!)

    if person.valid? && person.save
      flash["success"] = "Created Person successfully."
      redirect_to "/people"
    else
      flash["danger"] = "Could not create Person!"
      render("new.ecr")
    end
  end

  def edit
    if person = Person.find params["id"]
      render("edit.ecr")
    else
      flash["warning"] = "Person with ID #{params["id"]} Not Found"
      redirect_to "/people"
    end
  end

  def update
    if person = Person.find(params["id"])
      person.set_attributes(person_params.validate!)
      if person.valid? && person.save
        flash["success"] = "Updated Person successfully."
        redirect_to "/people"
      else
        flash["danger"] = "Could not update Person!"
        render("edit.ecr")
      end
    else
      flash["warning"] = "Person with ID #{params["id"]} Not Found"
      redirect_to "/people"
    end
  end

  def destroy
    if person = Person.find params["id"]
      person.destroy
    else
      flash["warning"] = "Person with ID #{params["id"]} Not Found"
    end
    redirect_to "/people"
  end

  def person_params
    params.validation do
      required(:name) { |f| !f.nil? }
      required(:thumb) { |f| !f.nil? }
      required(:flair) { |f| !f.nil? }
    end
  end
end
