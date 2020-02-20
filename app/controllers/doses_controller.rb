class DosesController < ApplicationController
  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    if @dose.save
      redirect_to dose_path(@dose)
    else
      render :new
    end
  end

  def destroy
    @dose.destroy
    redirect_to doses_path
  end

  private
    def dose_params
      params.require(:dose).permit(:name, :address, :phone_number, :category)
    end
end
