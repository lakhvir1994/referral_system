class InvitesController < ApplicationController
	# Index function is a autoload function which is called automatically when we go to the project url direct. 
	def index
		# This is used to show all data of our database and print it to the index template.
		@invites = Invite.all
	end
	def new
	end

	def create
	
		@user_exist = Invite.where(:user_email => params[:invite][:user_email]).count
		if @user_exist == 0

			total_shares = (params[:invite][:referral_mails]).split","
			total_shares = total_shares.length
			# render text: total_shares
			# Storing parameter to variable with mergeing date fields in it.
			@invite = Invite.new(invite_details_params.merge(total_shares: total_shares))
			if @invite.save
				@invite_value = Invite.where(:user_email => params[:invite][:user_email])
				render json: @invite_value
			end
		else
			# Fetch data from database on the basis of id comming on button click and store the value in variable.
  	# 		@invite = Invite.find(params[:user_email])
			# @invite.update(invite_details_params)
			# render_to edit_invite_path
			render text: "Record exist"
		end
		
		
	end

	def referral
		@user_email = params[:invite] 
	end

	# Destroy function is used to delete the coupon
	def destroy

		# Get the id of which coupon we want to delete or destroy.
		@invite = Invite.find(params[:id])

		# Call destroy function
		@invite.destroy

		# Redirect to index page.
		redirect_to invites_path
	end

	# Private function which create #.
	private
  	def invite_details_params
  		# Create # and passing parameters which are same in database and form fields.
    	params.require(:invite).permit(:user_email, :referral_mails)
  	end

end
