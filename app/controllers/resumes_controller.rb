class ResumesController < ApplicationController
   def index
      @resumes = Resume.all
   end
   
   def new
      @resume = Resume.new
   end
   
   def create
      @resume = Resume.new(resume_params)
      @resume.user_id = current_user.id
      if @resume.save
         redirect_to user_path(@resume.user_id), notice: "The resume #{@resume.name} has been uploaded."
      else
         render "new"
      end
      
   end
   
   def destroy
      @resume = Resume.find(params[:id])
      @resume.destroy
      redirect_to user_path(current_user.id), notice:  "The resume #{@resume.name} has been deleted."
   end
   
   private
      def resume_params
      params.require(:resume).permit(:name, :attachment)
   end
   
end