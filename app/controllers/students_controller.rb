class StudentsController < ApplicationController


  def get_all_students
    if ApplicationHelper.is_blank(params[:sort])
      students = Student.all.order(updated_at: :desc).as_json
    else
      students = Student.all.order(params[:sort] + " " + params[:direction]).as_json
    end
    render json: { success: true, data: students }
  end

  # GET /students/1 or /students/1.json
  def show
  end

  # GET /students/new
  def get_student_by_id
    student = Student.find_by(:id => params[:id])
    if ApplicationHelper.is_blank(student)
      response_object = { success: false, error: 'Student not found', data: '' }
    else
      response_object = { success: true, error: '', data: student.as_json }
    end
    render json: response_object
  end

  # upsert
  def create_or_update_student
    error = ''
    data = {}
    response_object = {}
    action = "create"
    Student.transaction do
      begin
        if ApplicationHelper.is_blank(params[:id])
          student = Student.new
        else
          student = Student.find_by(:id => params[:id])
          action = "update"
        end
        if ApplicationHelper.is_blank(student)
          error= "Record not found"
          data["error"] = "Record not found"
          response_object = { success: false, error: error, data: data }
        else
          student.assign_attributes(student_params)
          student.save
          data["student"] = student
          data["msg"] = "Student #{action}d Successfully"
          response_object = { success: true, error: error, data: data }
        end

      rescue StandardError => e
        error = "unable to save record:: #{e.to_s} "
        data["error"] = "Escalation #{action} Unsuccessful!"
        response_object = { success: false, error: error, data: data }
      end
    end
    render json: response_object
  end

  def delete_student
    error = ''
    data = {}
    student = Student.find_by(:id => params[:id])
    if ApplicationHelper.is_blank(student)
      error= "Record not found"
      data["error"] = "Record not found"
      response_object = { success: false, error: error, data: data }
    else
      student.assign_attributes(student_params)
      student.save
      data["student"] = student
      data["msg"] = "Student Deleted Successfully"
      response_object = { success: true, error: error, data: data }
    end
    render json: response_object
  end


  # DELETE /students/1 or /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: "Student was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def student_params
      params.require(:student).permit(:first_name, :last_name, :email, :phone, :is_deleted)
    end
end
