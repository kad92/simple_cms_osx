class SubjectsController < ApplicationController

  layout false
  def index
    @subjects = Subject.sorted
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new({:name => "default"})
  end

  def edit
    @subject = Subject.find(params[:id])
  end

  def update
    @subject = Subject.find(params[:id])

    if @subject.update_attributes(subject_params)
      redirect_to(:action => 'index')
    else
      render('edit')
    end
  end

  def create
    @subject = Subject.new(subject_params)

    if @subject.save
      redirect_to(:action => 'show')
    else
      render('edit')
    end

  end

  def delete
  end

  private
    def subject_params
      #same as using "params[:subject]",
      # - raises an error if :subject is not present
      # - allows listed attributes to be mass-assigned
      params.require(:subject).permit(:name,:position,:visible)
    end
end
