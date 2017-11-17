
module Authors
  class AccountsController < AuthorController

    def edit
    end

    def change_password
      author = current_author
      if author.valid_password?(authors_password_params[:current_password])
        if author.change_password(authors_password_params)
        #   update(
        #   password: authors_password_params[:new_password],
        #   password_confirmation: authors_password_params[:new_password_confirmation]
        # )

        sign_in(author, bypass: true)
        flash[:success] = "Successfully changed password..."
        else
          flash[:danger] = author.display_error_messages
      end
      else
        flash[:danger] = 'Current password was incorrect.'
      end
      redirect_to authors_account_path
    end

    def update_info
    if current_author.update(authors_info_params)
      flash[:notice] = "Successfully Saved Info..."
    else
      flash[:danger] = current_author.display_error_messages
    end
      redirect_to authors_account_path
  end

    private

    def authors_info_params
      params.require(:author).permit(:name, :email, :bio)
    end

    def authors_password_params
      params.require(:author).permit(:current_password, :new_password_confirmation, :new_password)
    end

  end
end
