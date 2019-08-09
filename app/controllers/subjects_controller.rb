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
  end

  def create
    @subject = Subject.new(params.require(:subject).permit(:name,:position,:visible))

    if @subject.save
      redirect_to(:action => 'index')
    else
      render('new')
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
