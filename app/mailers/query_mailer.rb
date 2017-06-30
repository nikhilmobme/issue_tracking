class QueryMailer < ApplicationMailer

def registration_confirmation(user_query)
	@user_query=user_query
	

	mail(to: @user_query.email, subject: "Query Received!!!!!!")
end
def owner_assigned(user_query)
	@user_query=user_query
	mail(to: @user_query.email, subject: "owner assigned!!!!!!!!!!")
end
def query_replied(user_query)
	@user_query=user_query
	@reply=Reply.find_by(:ticket_id=>@user_query.ticket_id)
    mail(to: @user_query.email, subject: "Replied!!!!!!!!!!")
end
end
