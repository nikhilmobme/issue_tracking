class RepliesController < ApplicationController


def save_reply
	puts "ddddddddddddddddddddddddddddddddddddddddddd"
	puts  params.inspect
	@reply= Reply.new
	@reply.ticket_id=params[:reply][:ticket_id]
	@reply.reply=params[:reply][:reply]
	@reply.replied_by=session[:e_name]
	@reply.save
	@user_query=UserQuery.find_by(:ticket_id=>params[:reply][:ticket_id])
	@user_query.owner=session[:e_name]
	@user_query.status="completed"
	@user_query.save
	QueryMailer.query_replied(@user_query).deliver
    redirect_to display_query_path


end

def save_owner
    @user_query=UserQuery.find_by(:ticket_id=>params[:employee][:ticket_id])
	@user_query.owner=params[:owner]
	@user_query.status="waiting for the owner reply"
	@user_query.save
	QueryMailer.owner_assigned(@user_query).deliver
    redirect_to display_query_path
	
end

def onhold_status

    @user_query=UserQuery.find(params[:format])
    @user_query.owner=session[:e_name]
    @user_query.status="On Hold"
    @user_query.save
	QueryMailer.owner_assigned(@user_query).deliver
    redirect_to display_query_path


   
end
end
