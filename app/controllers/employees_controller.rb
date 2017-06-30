class EmployeesController < ApplicationController

  def index
  end
  def employee_login
  
  end
  def create_login
  	puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
  	puts params.inspect
  if @employee=Employee.find_by(:email=>params[:employee][:email])
  	if @employee.password_hash==params[:employee][:password]
  		session[:e_id]=@employee.e_id
  		session[:e_name]=@employee.name
  		  	redirect_to display_query_path


  	else
  		flash[:faliure]="password error"
      redirect_to employee_login_path
  	end
   else
   	flash[:faliure]="employee with this name is not exists"
    redirect_to employee_login_path
  end

  end
  def employee_logout
  	session[:e_id]=nil
  	session[:e_name]=nil
  	redirect_to root_path

  end

end
