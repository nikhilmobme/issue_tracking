class UserQueriesController < ApplicationController
def new_query
@user_query = UserQuery.new
end
def add_query
	if params[:user_query][:subject]==nil ||params[:user_query][:raised_by]==nil||params[:user_query][:query]==nil
		flash[:failure]="fill all necessary fields"
		redirect_to new_query_path
	else
	@user_query = UserQuery.new
	@user_query.subject=params[:user_query][:subject]
	@user_query.department=params[:department]
	@user_query.raised_by=params[:user_query][:raised_by]
	@user_query.email=params[:user_query][:email]
	@user_query.status="waiting for staff response"
	@user_query.query=params[:user_query][:query]
	extension=rand(100000)
	ticket_value="ABC-#{extension}"
	@user_query.ticket_id=ticket_value
	@user_query.save!
	QueryMailer.registration_confirmation(@user_query).deliver
	redirect_to root_path
    end


end

def display_query
	@unassigned=UserQuery.where("owner IS ?", nil)
	@assigned=UserQuery.where("status != ? AND owner = ?", "completed", session[:e_name])
	@completed=UserQuery.where("status = ? AND owner = ?", "completed", session[:e_name])

end

def view_query
	@user_query=UserQuery.find(params[:format])
	@employee=Employee.all
	
end
def view_reply
@user_query=UserQuery.find(params[:format])
@reply=Reply.find_by(:ticket_id=>@user_query.ticket_id)
end
def view_details 
@user_query=UserQuery.find(params[:format])
@reply=Reply.find_by(:ticket_id=>@user_query.ticket_id)
end
end
